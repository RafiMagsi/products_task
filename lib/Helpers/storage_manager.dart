import 'package:get_storage/get_storage.dart';

class StorageManager {
  static final GetStorage _box = GetStorage();
  static String darkEnabled = 'dark_theme_enabled';
  static String isFirstLaunch = 'first_launch';
  static String products = 'products';

  static Future<bool> getBool(String key) async {
    return _box.read(key) ?? false;
  }

  static void setBool(String key, bool value) {
    _box.write(key, value);
  }

  static dynamic getString(String key) {
    return _box.read(key) ?? '';
  }

  static void setString(String key, dynamic value) {
    _box.write(key, value);
  }

  static remove(String key) async {
    _box.remove(key);
  }
}
