import '../folders.dart';

abstract class FolderRepository {
  Future<FolderModel> createFolder({
    required CreateFolderPayload payload,
  });

  Future<bool> deleteFolder({
    required DeleteFolderPayload payload,
  });

  Future<List<FolderModel>> getFolders({
    required GetFoldersPayload payload,
  });
}
