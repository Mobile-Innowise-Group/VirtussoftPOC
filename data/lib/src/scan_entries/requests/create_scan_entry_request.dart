class CreateScanEntryRequest {
  final String path;
  final String folderId;
  final String categoryId;

  CreateScanEntryRequest({
    required this.path,
    required this.folderId,
    required this.categoryId,
  });
}
