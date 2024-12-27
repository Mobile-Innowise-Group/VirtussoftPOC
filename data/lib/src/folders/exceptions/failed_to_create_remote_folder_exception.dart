class FailedToCreateRemoteFolderException implements Exception {
  final String message;

  FailedToCreateRemoteFolderException(this.message);

  @override
  String toString() {
    return 'Failed to create a remote folder: $message';
  }
}
