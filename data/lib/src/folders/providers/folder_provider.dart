import 'package:domain/domain.dart';

import '../folders.dart';

abstract class FolderProvider {
  Future<List<FolderModel>> getUserFolders({
    required GetFoldersRequest request,
  });

  Future<FolderModel> getUserFolderById({
    required GetFolderByIdRequest request,
  });

  Future<FolderModel> createFolder({
    required CreateFolderRequest request,
  });

  Future<bool> deleteFolder({
    required DeleteFolderRequest request,
  });
}
