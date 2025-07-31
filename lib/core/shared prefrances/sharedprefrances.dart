import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesitem {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }
}