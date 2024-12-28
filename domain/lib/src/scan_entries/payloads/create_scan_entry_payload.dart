class CreateScanEntryPayload {
  final String scanLocalPath;
  final String folderId;
  final String categoryId;

  CreateScanEntryPayload({
    required this.scanLocalPath,
    required this.folderId,
    required this.categoryId,
  });
}
