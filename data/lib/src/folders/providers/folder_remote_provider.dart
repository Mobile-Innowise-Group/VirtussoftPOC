import 'package:domain/domain.dart';

import '../folders.dart';

abstract class FolderRemoteProvider {
  Future<List<FolderModel>> getFolders({
    required GetFoldersRequest request,
  });

  Future<FolderModel> createFolder({
    required CreateFolderRemoteRequest request,
  });

  Future<bool> deleteFolder({
    required DeleteFolderRequest request,
  });
}
