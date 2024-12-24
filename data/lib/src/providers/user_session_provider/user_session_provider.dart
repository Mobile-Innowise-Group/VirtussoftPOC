abstract class UserSessionProvider {
  Future<void> saveSession({
    required String sessionId,
  });

  Future<String?> readSession();

  Future<void> clearSession();
}
