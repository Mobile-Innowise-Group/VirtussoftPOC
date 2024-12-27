import 'package:domain/src/folders/models/folder_model.dart';

import '../../../data.dart';
import '../folders.dart';

class FolderLocalProviderImpl implements FolderLocalProvider {
  final DatabaseProvider _databaseProvider;

  FolderLocalProviderImpl({
    required DatabaseProvider databaseProvider,
  }) : _databaseProvider = databaseProvider;

  @override
  Future<int> createFolder({
    required CreateFolderLocalRequest request,
  }) async {
    return _databaseProvider.createFolder(request.toJson());
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
      return FolderMapper.toModel(FolderEntity.fromJson(folder));
    }).toList();
  }
}
