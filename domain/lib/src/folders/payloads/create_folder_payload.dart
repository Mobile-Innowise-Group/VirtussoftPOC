class CreateFolderPayload {
  final String name;
  final bool isPrivate;

  CreateFolderPayload({
    required this.name,
    this.isPrivate = false,
  });
}
