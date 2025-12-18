import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static Future<void> saveUser(Map<String, dynamic> user) async {
    final Map<String, dynamic> userJson = {'name': 'Girish'};
    // Save full user json
    await _storage.write(key: "user", value: jsonEncode(userJson));
    // Save token separately
    // await _storage.write(key: "token", value: user.token);
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final jsonStr = await _storage.read(key: "user");

    if (jsonStr == null) return null;
    return (jsonDecode(jsonStr));
  }

  // Get only token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  // Delete
  static Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  // Delete all
  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
