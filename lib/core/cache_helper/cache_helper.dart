import 'package:shared_preferences/shared_preferences.dart';

import '../services_locator/services_locator.dart';

class CacheHelper {
  static dynamic getSharedPreferencesValue({required String key}) {
    return serviceLocator<SharedPreferences>().get(key);
  }

  static Future<bool> saveDataToSharedPreferences(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await serviceLocator<SharedPreferences>().setString(key, value);
    }

    if (value is int) {
      return await serviceLocator<SharedPreferences>().setInt(key, value);
    }
    if (value is bool) {
      return await serviceLocator<SharedPreferences>().setBool(key, value);
    }
    return await serviceLocator<SharedPreferences>().setDouble(key, value);
  }

  static Future<bool> removeDataFromSharedPreferences(
      {required String key}) async {
    return serviceLocator<SharedPreferences>().remove(key);
  }
}
