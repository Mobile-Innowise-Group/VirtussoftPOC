import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../folders.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderProvider _folderProvider;

  FolderRepositoryImpl({
    required FolderProvider folderProvider,
  }) : _folderProvider = folderProvider;

  @override
  Future<FolderModel> createFolder({
    required CreateFolderPayload payload,
  }) async {
    final FolderModel createdFolder = await _folderProvider.createFolder(
      request: CreateFolderRequest(
        name: payload.name,
      ),
    );

    final Directory directory = await getApplicationDocumentsDirectory();
    final String categoriesPath = '${directory.path}/folders';
    final Directory categoriesFolder = Directory(categoriesPath);

    if (!categoriesFolder.existsSync()) {
      await categoriesFolder.create();
    }

    final String categoryPath = '${directory.path}/folders/${payload.name}';
    final Directory folder = Directory(categoryPath);

    if (!folder.existsSync()) {
      await folder.create();
      AppLogger().info('Folder created at: $categoriesPath');
    } else {
      AppLogger().info('Folder already exists at: $categoriesPath');
    }
    return createdFolder;
  }

  @override
  Future<bool> deleteFolder({
    required DeleteFolderPayload payload,
  }) async {
    final bool response = await _folderProvider.deleteFolder(
      request: DeleteFolderRequest(
        folderId: payload.folder.id,
      ),
    );

    final Directory directory = await getApplicationDocumentsDirectory();
    final String categoryPath =
        '${directory.path}/folders/${payload.folder.name}';
    final Directory folder = Directory(categoryPath);

    if (folder.existsSync()) {
      await folder.delete(recursive: true);
      AppLogger().info('Folder deleted at: $categoryPath');
    } else {
      AppLogger().info('Folder does not exist at: $categoryPath');
    }
    return response;
  }

  @override
  Future<List<FolderModel>> getFolders({
    required GetFoldersPayload payload,
  }) {
    return _folderProvider.getUserFolders(
      request: GetFoldersRequest(),
    );
  }
}
