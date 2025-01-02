class FailedToEditRemoteFolderException implements Exception {
  final String message;

  FailedToEditRemoteFolderException(this.message);

  @override
  String toString() {
    return 'Failed to edit a remote folder: $message';
  }
}
