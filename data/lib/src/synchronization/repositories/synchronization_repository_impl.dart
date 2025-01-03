import 'package:domain/domain.dart';

import '../../categories/categories.dart';
import '../../folders/folders.dart';
import '../provider/synchronization_provider.dart';

class SynchronizationRepositoryImpl implements SynchronizationRepository {
  final SynchronizationProvider _synchronizationProvider;
  final CategoryRemoteProvider _categoryRemoteProvider;
  final FolderRemoteProvider _folderRemoteProvider;
  final CategoryLocalProvider _categoryLocalProvider;
  final FolderLocalProvider _folderLocalProvider;

  SynchronizationRepositoryImpl({
    required SynchronizationProvider synchronizationProvider,
    required CategoryRemoteProvider categoryRemoteProvider,
    required FolderRemoteProvider folderRemoteProvider,
    required CategoryLocalProvider categoryLocalProvider,
    required FolderLocalProvider folderLocalProvider,
  })  : _synchronizationProvider = synchronizationProvider,
        _folderRemoteProvider = folderRemoteProvider,
        _folderLocalProvider = folderLocalProvider,
        _categoryLocalProvider = categoryLocalProvider,
        _categoryRemoteProvider = categoryRemoteProvider;

  @override
  Future<void> synchronize({
    required SynchronizeDataPayload payload,
  }) async {
    final bool isFirstLaunch = await _synchronizationProvider.isFirstLaunch();
    if (!isFirstLaunch) {
      return;
    }

    final List<FolderModel> remoteFolders = await _folderRemoteProvider.getFolders(
      request: GetFoldersRequest(),
    );

    final List<CategoryModel> remoteCategories = await _categoryRemoteProvider.getCategories(
      request: GetCategoriesRequest(),
    );

    for (final FolderModel remoteFolder in remoteFolders) {
      await _folderLocalProvider.createFolder(
        request: CreateFolderLocalRequest(
          name: remoteFolder.name,
          id: remoteFolder.id,
          isPrivate: remoteFolder.isPrivate ? 1 : 0,
        ),
      );
    }

    for (final CategoryModel remoteCategory in remoteCategories) {
      await _categoryLocalProvider.createCategory(
        request: CreateCategoryLocalRequest(
          name: remoteCategory.name,
          id: remoteCategory.id,
        ),
      );
    }

    await _synchronizationProvider.setFirstLaunch();
  }
}
