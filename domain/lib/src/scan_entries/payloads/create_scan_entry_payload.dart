class CreateScanEntryPayload {
  final String path;
  final String folderId;
  final String categoryId;

  CreateScanEntryPayload({
    required this.path,
    required this.folderId,
    required this.categoryId,
  });
}
