import 'package:domain/domain.dart';
import '../../categories/categories.dart';
import '../../folders/folders.dart';
import '../scan_entries.dart';

class ScanEntriesRepositoryImpl implements ScanEntriesRepository {
  final ScanEntriesProvider _scanEntriesProvider;
  final FolderProvider _folderProvider;
  final CategoryProvider _categoryProvider;

  ScanEntriesRepositoryImpl({
    required ScanEntriesProvider scanEntriesProvider,
    required FolderProvider folderProvider,
    required CategoryProvider categoryProvider,
  })  : _scanEntriesProvider = scanEntriesProvider,
        _folderProvider = folderProvider,
        _categoryProvider = categoryProvider;

  @override
  Future<ScanEntryModel> createScanEntry({
    required CreateScanEntryPayload payload,
  }) async {
    final ScanEntryEntity scanEntryEntity = await _scanEntriesProvider.createScanEntry(
      request: CreateScanEntryRequest(
        path: payload.path,
        folderId: payload.folderId,
        categoryId: payload.categoryId,
      ),
    );

    final FolderModel folder = await _folderProvider.getUserFolderById(
      request: GetFolderByIdRequest(
        folderId: scanEntryEntity.folderId,
      ),
    );

    final CategoryModel category = await _categoryProvider.getUserCategoryById(
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
}
