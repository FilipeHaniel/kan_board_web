import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage implements AuthStorage {
  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
  }
}
