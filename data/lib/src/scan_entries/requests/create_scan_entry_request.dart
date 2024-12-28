class CreateScanEntryRequest {
  final String userId;
  final String localPath;
  final String remotePath;
  final String folderId;
  final String categoryId;

  CreateScanEntryRequest({
    required this.userId,
    required this.localPath,
    required this.remotePath,
    required this.folderId,
    required this.categoryId,
  });
}
