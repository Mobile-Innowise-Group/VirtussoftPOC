abstract class TokenProvider {
  Future<String?> readToken();

  Future<void> writeToken({required String token});

  Future<void> clearToken();
}
