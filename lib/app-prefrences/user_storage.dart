import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const String _keyUserId = "userId";
  static const String _keyName = "name";
  static const String _keyEmail = "email";
  static const String _keyPhone = "phone";
  static const String _keyPassword = "password";

  static Future<void> saveUser(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, userData["id"].toString());
    await prefs.setString(_keyName, userData["name"] ?? "");
    await prefs.setString(_keyEmail, userData["email"] ?? "");
    await prefs.setString(_keyPhone, userData["phone"] ?? "");
  }

  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "userId": prefs.getString(_keyUserId),
      "name": prefs.getString(_keyName),
      "email": prefs.getString(_keyEmail),
      "phone": prefs.getString(_keyPhone),
    };
  }

  static Future<void> saveLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  static Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPassword);
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
