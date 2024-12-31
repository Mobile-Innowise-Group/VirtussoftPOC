class CreateFolderRemoteRequest {
  final String name;
  final String id;
  final String userId;
  final bool isPrivate;

  CreateFolderRemoteRequest({
    required this.name,
    required this.id,
    required this.userId,
    required this.isPrivate,
  });
}
