import 'package:shared_preferences/shared_preferences.dart';

import 'auth_storage.dart';

class LocalAuthStorage implements AuthStorage {
  static const _tokenKey = 'access_token';

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tokenKey);
  }
}
