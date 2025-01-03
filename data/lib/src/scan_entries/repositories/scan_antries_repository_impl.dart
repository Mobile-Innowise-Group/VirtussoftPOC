import 'package:domain/domain.dart';
import '../../auth/auth.dart';
import '../../auth/entities/user/user_entity.dart';
import '../../categories/categories.dart';
import '../../folders/folders.dart';
import '../requests/get_scan_entries_by_folder_id_request.dart';
import '../requests/upload_scan_file_request.dart';
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
    final String userId = userEntity.id;

    final String scanRemoteLink = await _scanEntriesProvider.uploadScanFile(
      request: UploadScanFileRequest(
        userId: userId,
        localPath: payload.scanLocalPath,
      ),
    );

    final ScanEntryEntity scanEntryEntity =
        await _scanEntriesProvider.createScanEntry(
      request: CreateScanEntryRequest(
        localPath: payload.scanLocalPath,
        remotePath: scanRemoteLink,
        folderId: payload.folderId,
        categoryId: payload.categoryId,
        userId: userEntity.id,
      ),
    );

    final FolderModel folder = await _folderProvider.getUserFolderById(
      request: GetFolderByIdRequest(
        folderId: scanEntryEntity.folderId,
      ),
    );

    final CategoryModel category = await _categoryLocalProvider.getCategoryById(
      request: GetUserCategoryByIdRequest(
        categoryId: scanEntryEntity.categoryId,
      ),
    );

    return ScanEntryMapper.toModel(
      scanEntryEntity: scanEntryEntity,
      folder: folder,
      category: category,
    );
  }

  @override
  Future<bool> deleteScanEntry({
    required DeleteScanEntryPayload payload,
  }) {
    // TODO: implement deleteScanEntry
    throw UnimplementedError();
  }

  @override
  Future<List<ScanEntryModel>> getScanEntries({
    required GetScanEntriesPayload payload,
  }) {
    // TODO: implement getScanEntries
    throw UnimplementedError();
  }

  @override
  Future<List<ScanEntryModel>> getScanEntriesByFolderId({
    required GetScanEntriesByFolderIdPayload payload,
  }) async {
    final List<ScanEntryEntity> scanEntries =
        await _scanEntriesProvider.getScanEntriesByFolderId(
      request: GetScanEntriesByFolderIdRequest(folderId: payload.folder.id),
    );

    final List<Future<ScanEntryModel>> futures =
        scanEntries.map((ScanEntryEntity scanEntryEntity) async {
      final CategoryModel category =
          await _categoryLocalProvider.getCategoryById(
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
}
