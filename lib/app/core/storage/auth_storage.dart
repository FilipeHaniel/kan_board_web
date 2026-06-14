abstract class AuthStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clear();
}
