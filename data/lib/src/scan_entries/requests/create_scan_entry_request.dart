class CreateScanEntryRequest {
  final String scanPath;
  final String folderId;
  final String categoryId;

  CreateScanEntryRequest({
    required this.scanPath,
    required this.folderId,
    required this.categoryId,
  });
}
