class FailedToCreateRemoteCategoryException implements Exception {
  final String message;

  FailedToCreateRemoteCategoryException(this.message);

  @override
  String toString() {
    return 'Failed to create a remote category: $message';
  }
}
