import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> saveUser(Map<String, dynamic> response) async {
    final String userJson = jsonEncode(response);
    await _storage.write(key: "user", value: userJson);

    //Save token
    final token = response['data']['token'];
    await _storage.write(key: 'token', value: token);
  }

  static Future<Map<String, dynamic>> getUser() async {
    final String? userJson = await _storage.read(key: "user");
    if (userJson == null || userJson.isEmpty) {
      return {};
    }
    try {
      final Map<String, dynamic> userMap =
          jsonDecode(userJson) as Map<String, dynamic>;
      return userMap;
    } catch (e) {
      // If parsing fails return an empty map
      return {};
    }
  }

  // Get only token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }
}
