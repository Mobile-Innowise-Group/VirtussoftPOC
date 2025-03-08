import 'dart:io';
import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../../auth/auth.dart';
import '../../auth/entities/user/user_entity.dart';
import '../../categories/categories.dart';
import '../../folders/folders.dart';
import '../requests/get_scan_entries_by_folder_id_request.dart';
import '../requests/upload_photos_request.dart';
import '../scan_entries.dart';

class ScanEntriesRepositoryImpl implements ScanEntriesRepository {
  final ScanEntriesProvider _scanEntriesProvider;
  final FolderRemoteProvider _folderProvider;
  final CategoryLocalProvider _categoryLocalProvider;
  final AuthorizationProvider _authorizationProvider;

  ScanEntriesRepositoryImpl({
    required ScanEntriesProvider scanEntriesProvider,
    required FolderRemoteProvider folderProvider,
    required AuthorizationProvider authorizationProvider,
    required CategoryLocalProvider categoryLocalProvider,
  })  : _scanEntriesProvider = scanEntriesProvider,
        _folderProvider = folderProvider,
        _authorizationProvider = authorizationProvider,
        _categoryLocalProvider = categoryLocalProvider;

  @override
  Future<ScanEntryModel> createScanEntry({
    required CreateScanEntryPayload payload,
  }) async {
    final UserEntity? userEntity = _authorizationProvider.getCurrentUser();

    if (userEntity == null) {
      // TODO(Karatysh): logout instead
      throw const AppException('no current user');
    }

    final File placeholderFile = await PdfService.generateCenteredText(const <String>[]);

    final String localPath = await PdfService.transferFile(
      currentFilePath: placeholderFile.path,
      newFolderName: payload.folder.name,
    );

    try {
      final ExtendedScanEntryEntity scanEntryEntity = await _scanEntriesProvider.createScanEntry(
        request: CreateScanEntryRequest(
          localPath: localPath,
          folderId: payload.folder.id,
          categoryId: payload.categoryId,
          userId: userEntity.id,
          receipt: ReceiptMapper.toEntity(payload.receipt),
        ),
      );

      final Uint8List generatedPdf = await _scanEntriesProvider.downloadScanFile(
        request: DownloadScanFileRequest(remotePath: scanEntryEntity.remotePath),
      );

      await PdfService.rewriteFile(
        path: scanEntryEntity.localPath,
        bytes: generatedPdf,
      );

      final CategoryModel category = await _categoryLocalProvider.getCategoryById(
        request: GetUserCategoryByIdRequest(
          categoryId: scanEntryEntity.category.id,
        ),
      );

      return ScanEntryMapper.toModelFromExtended(
        scanEntryEntity: scanEntryEntity,
        folder: payload.folder,
        category: category,
      );
    } catch (_) {
      await PdfService.deleteFile(path: localPath);
      rethrow;
    }
  }

  @override
  Future<bool> deleteScanEntry({
    required DeleteScanEntryPayload payload,
  }) {
    // TODO: implement deleteScanEntry
    throw UnimplementedError();
  }

  @override
  Future<List<ScanEntryModel>> getAllUserScanEntries({
    required GetScanEntriesPayload payload,
  }) async {
    return _scanEntriesProvider.getAllUserScanEntries(request: GetAllUserScanEntriesRequest());
  }

  @override
  Future<List<ScanEntryModel>> getScanEntriesByFolderId({
    required GetScanEntriesByFolderIdPayload payload,
  }) async {
    final List<ScanEntryEntity> scanEntries = await _scanEntriesProvider.getScanEntriesByFolderId(
      request: GetScanEntriesByFolderIdRequest(folderId: payload.folder.id),
    );

    final List<Future<ScanEntryModel>> futures =
        scanEntries.map((ScanEntryEntity scanEntryEntity) async {
      final CategoryModel category = await _categoryLocalProvider.getCategoryById(
        request: GetUserCategoryByIdRequest(
          categoryId: scanEntryEntity.categoryId,
        ),
      );

      return ScanEntryMapper.toModel(
        scanEntryEntity: scanEntryEntity,
        folder: payload.folder,
        category: category,
      );
    }).toList();

    final List<ScanEntryModel> scanEntryModels = await Future.wait(futures);

    return scanEntryModels;
  }

  @override
  Future<List<ScanEntryModel>> getScanEntriesByCategory({
    required GetScanEntriesByCategoryPayload payload,
  }) async {
    final List<ScanEntryEntity> scanEntries = await _scanEntriesProvider.getScanEntriesByCategory(
      request: GetUserScansByCategoryRequest(payload.category.id),
    );

    final List<Future<ScanEntryModel>> futures =
        scanEntries.map((ScanEntryEntity scanEntryEntity) async {
      final FolderModel folder = await _folderProvider.getUserFolderById(
        request: GetFolderByIdRequest(
          folderId: scanEntryEntity.folderId,
        ),
      );

      return ScanEntryMapper.toModel(
        scanEntryEntity: scanEntryEntity,
        folder: folder,
        category: payload.category,
      );
    }).toList();

    final List<ScanEntryModel> scanEntryModels = await Future.wait(futures);

    return scanEntryModels;
  }

  @override
  Future<void> downloadScanFile({
    required DownloadScanFilePayload payload,
  }) async {
    final Uint8List downloadedData = await _scanEntriesProvider.downloadScanFile(
      request: DownloadScanFileRequest(
        remotePath: payload.scan.remotePath,
      ),
    );

    final Directory directory = await getApplicationDocumentsDirectory();
    final Directory folderDirectory = Directory('${directory.path}/${payload.scan.folder.name}');
    if (!folderDirectory.existsSync()) {
      await folderDirectory.create();
    }

    final String fileName = payload.scan.localPath.split('/').last;

    final File file = File('${folderDirectory.path}/$fileName');
    await file.create();

    await file.writeAsBytes(downloadedData);
  }

  @override
  Future<ReceiptModel> uploadPhotosForRecognition({
    required UploadPhotosForRecognitionPayload payload,
  }) async {
    final List<File> files = payload.localFilePaths.map(File.new).toList(growable: false);

    final ReceiptEntity entity = await _scanEntriesProvider.uploadPhotos(
      request: UploadPhotosRequest(files: files),
    );

    return ReceiptMapper.fromEntity(entity);
  }

  @override
  Future<List<ReceiptModel>> getAllUserReceipts({
    required GetAllUserReceiptsPayload payload,
  }) async {
    final UserEntity? userEntity = _authorizationProvider.getCurrentUser();

    if (userEntity == null) {
      throw const AppException('no current user');
    }

    final List<ReceiptEntity> entities = await _scanEntriesProvider.getAllUserReceipts(
      request: GetAllUserReceiptsRequest(
        userId: userEntity.id,
      ),
    );

    return entities.map<ReceiptModel>(ReceiptMapper.fromEntity).toList();
  }
}
