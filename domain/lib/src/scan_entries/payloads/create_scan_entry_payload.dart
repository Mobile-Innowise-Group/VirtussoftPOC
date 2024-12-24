class CreateScanEntryPayload {
  final String scanPath;
  final String folderId;
  final String categoryId;

  CreateScanEntryPayload({
    required this.scanPath,
    required this.folderId,
    required this.categoryId,
  });
}
