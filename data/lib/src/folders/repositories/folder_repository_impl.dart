import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../folders.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderRemoteProvider _folderRemoteProvider;
  final FolderLocalProvider _folderLocalProvider;

  FolderRepositoryImpl({
    required FolderRemoteProvider folderRemoteProvider,
    required FolderLocalProvider folderLocalProvider,
  })  : _folderRemoteProvider = folderRemoteProvider,
        _folderLocalProvider = folderLocalProvider;

  @override
  Future<FolderModel> createFolder({
    required CreateFolderPayload payload,
  }) async {
    final int createdFolderId = await _folderLocalProvider.createFolder(
      request: CreateFolderLocalRequest(
        name: payload.name,
      ),
    );

    final FolderModel createdRemoteFolder =
        await _folderRemoteProvider.createFolder(
      request: CreateFolderRemoteRequest(
        name: payload.name,
        id: createdFolderId,
      ),
    );

    final Directory directory = await getApplicationDocumentsDirectory();
    final String foldersPath = '${directory.path}/folders';
    final Directory foldersDirectory = Directory(foldersPath);

    if (!foldersDirectory.existsSync()) {
      AppLogger().info('Creating folders directory at: $foldersPath');
      await foldersDirectory.create();
    } else {
      AppLogger().info('Folders directory already exists at: $foldersPath');
    }

    return createdRemoteFolder;
  }

  @override
  Future<bool> deleteFolder({
    required DeleteFolderPayload payload,
  }) async {
    final bool response = await _folderRemoteProvider.deleteFolder(
      request: DeleteFolderRequest(
        folderId: payload.folder.id,
      ),
    );

    await _folderLocalProvider.deleteFolder(
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
    return _folderLocalProvider.getFolders(
      request: GetFoldersRequest(),
    );
  }
}
