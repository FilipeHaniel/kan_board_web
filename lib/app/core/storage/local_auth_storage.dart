import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'auth_storage.dart';

class LocalAuthStorage implements AuthStorage {
  static const _tokenKey = 'access_token';

  @override
  Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final success = await prefs.setString(
        _tokenKey,
        token,
      );

      log('TOKEN SALVO? $success');
    } catch (error, stackTrace) {
      log('Erro ao salvar token: $error');
      log('Stack trace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tokenKey);
  }
}
