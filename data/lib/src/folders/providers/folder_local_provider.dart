import 'package:domain/domain.dart';

import '../folders.dart';

abstract class FolderLocalProvider {
  Future<FolderModel> createFolder({
    required CreateFolderLocalRequest request,
  });

  Future<List<FolderModel>> getFolders({
    required GetFoldersRequest request,
  });

  Future<void> deleteFolder({
    required DeleteFolderRequest request,
  });

  Future<void> editFolder({
    required EditLocalFolderRequest request,
  });
}
