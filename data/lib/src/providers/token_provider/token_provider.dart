abstract class TokenProvider {
  Future<String?> readAccessToken();

  Future<void> updateTokens();
}
