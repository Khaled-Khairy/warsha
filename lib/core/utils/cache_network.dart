import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork {
  final SharedPreferences sharedPreferences;

  CacheNetwork(this.sharedPreferences);

  Future<bool> saveData({required String key, required String value}) {
    return sharedPreferences.setString(key, value);
  }

  String getData({required String key}) {
    return sharedPreferences.getString(key) ?? "";
  }

  Future<bool> deleteData({required String key}) {
    return sharedPreferences.remove(key);
  }
}
