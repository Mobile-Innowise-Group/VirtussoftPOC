import 'package:domain/src/folders/models/folder_model.dart';

import '../../../data.dart';
import '../folders.dart';

class FolderLocalProviderImpl implements FolderLocalProvider {
  final DatabaseProvider _databaseProvider;

  FolderLocalProviderImpl({
    required DatabaseProvider databaseProvider,
  }) : _databaseProvider = databaseProvider;

  @override
  Future<FolderModel> createFolder({
    required CreateFolderLocalRequest request,
  }) async {
    final int row = await _databaseProvider.createFolder(request.toJson());
    return _getFolderByRow(row: row);
  }

  @override
  Future<void> deleteFolder({
    required DeleteFolderRequest request,
  }) async {
    await _databaseProvider.deleteFolder(request.folderId);
  }

  @override
  Future<List<FolderModel>> getFolders({
    required GetFoldersRequest request,
  }) async {
    final List<Map<String, dynamic>> folders =
        await _databaseProvider.getFolders();
    return folders.map((Map<String, dynamic> folder) {
      return FolderMapper.toModelFromLocal(FolderLocalEntity.fromJson(folder));
    }).toList();
  }

  Future<FolderModel> _getFolderByRow({
    required int row,
  }) async {
    final List<Map<String, dynamic>> folders =
        await _databaseProvider.getFoldersWithOffset(offset: row - 1);
    return FolderMapper.toModelFromLocal(
        FolderLocalEntity.fromJson(folders.first));
  }

  @override
  Future<void> editFolder({
    required EditLocalFolderRequest request,
  }) async {
    await _databaseProvider.editFolder(request.folder.toJson());
  }
}
