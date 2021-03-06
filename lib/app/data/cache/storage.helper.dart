import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static const String token = "TOKEN";
  static const String cookie = "COOKIE";
  static const String login = "LOGIN";
  static const String password = "PASSWORD";
  static const String uid = "uid";
}

class StorageHelper {
  static SharedPreferences? _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

   Future<String?> get(String key) async {
    await _getInstance();
    return _prefs != null ? _prefs!.getString(key) : null;
  }

   void set(String key, dynamic value) async {
    await _getInstance();
    if (_prefs != null) _prefs!.setString(key, value);
  }

   void remove(String key) async {
    await _getInstance();
    if (_prefs != null) _prefs!.remove(key);
  }
}
