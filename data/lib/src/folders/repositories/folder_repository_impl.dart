import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../../auth/auth.dart';
import '../../auth/entities/user/user_entity.dart';
import '../folders.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderRemoteProvider _folderRemoteProvider;
  final FolderLocalProvider _folderLocalProvider;
  final AuthorizationProvider _authorizationProvider;

  FolderRepositoryImpl({
    required FolderRemoteProvider folderRemoteProvider,
    required FolderLocalProvider folderLocalProvider,
    required AuthorizationProvider authorizationProvider,
  })  : _folderRemoteProvider = folderRemoteProvider,
        _folderLocalProvider = folderLocalProvider,
        _authorizationProvider = authorizationProvider;

  @override
  Future<FolderModel> createFolder({
    required CreateFolderPayload payload,
  }) async {
    final UserEntity? userEntity = _authorizationProvider.getCurrentUser();

    if (userEntity == null) {
      // TODO(Karatysh): logout instead
      throw const AppException('no current user');
    }

    final FolderModel folder = await _folderLocalProvider.createFolder(
      request: CreateFolderLocalRequest(
        name: payload.name,
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
    try {
      final FolderModel createdRemoteFolder =
          await _folderRemoteProvider.createFolder(
        request: CreateFolderRemoteRequest(
          name: folder.name,
          id: folder.id,
          userId: userEntity.id,
        ),
      );

      return createdRemoteFolder;
    } catch (e) {
      throw FailedToCreateRemoteFolderException(e.toString());
    }
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
  Future<List<FolderModel>> getPublicFolders({
    required GetPublicFoldersPayload payload,
  }) async {
    final List<FolderModel> folders = await _folderLocalProvider.getFolders(
      request: GetFoldersRequest(),
    );

    return folders.where((FolderModel folder) => !folder.isPrivate).toList();
  }

  @override
  Future<List<FolderModel>> getPrivateFolders({
    required GetPrivateFoldersPayload payload,
  }) async {
    final List<FolderModel> folders = await _folderLocalProvider.getFolders(
      request: GetFoldersRequest(),
    );

    return folders.where((FolderModel folder) => folder.isPrivate).toList();
  }

  @override
  Future<List<FolderModel>> getAllFolders({
    required GetAllFoldersPayload payload,
  }) {
    return _folderLocalProvider.getFolders(
      request: GetFoldersRequest(),
    );
  }
}
