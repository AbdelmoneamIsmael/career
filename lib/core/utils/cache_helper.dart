import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:career/core/const/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreference;
  static Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
    CacheHelper.getData(key: "lang") ??
        CacheHelper.saveData(key: StorageKeys.lang, value: "ar");
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await sharedPreference.setInt(key, value);
    }
    if (value is String) {
      return await sharedPreference.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreference.setBool(key, value);
    }
    return await sharedPreference.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreference.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreference.remove(key);
  }

  /// save Strings with Secure
  /// exampel secure token and passwords
  static Future<void> setSecuerString(
      {required String key, required String value}) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// get  Strings with Secure
  /// exampel secure token and passwords
  static Future<String> getSecuerString({
    required String key,
  }) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? "";
  }
}
