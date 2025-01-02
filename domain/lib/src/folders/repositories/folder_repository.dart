import '../folders.dart';

abstract class FolderRepository {
  Future<FolderModel> createFolder({
    required CreateFolderPayload payload,
  });

  Future<bool> deleteFolder({
    required DeleteFolderPayload payload,
  });

  Future<List<FolderModel>> getPublicFolders({
    required GetPublicFoldersPayload payload,
  });

  Future<List<FolderModel>> getPrivateFolders({
    required GetPrivateFoldersPayload payload,
  });

  Future<List<FolderModel>> getAllFolders({
    required GetAllFoldersPayload payload,
  });

  Future<FolderModel> toggleFolderPrivacy({
    required ToggleFolderPrivacyPayload payload,
  });
}
