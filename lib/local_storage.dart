import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static String isLoggedIn = 'isLoggedIn';
  static String isFirstInstalled = 'isFirstInstalled';
  static String isFirstSignIn = 'isFirstSignIn';
  static String userId = 'userId';
  static String userData = 'userData';
  static String userType = 'userType';
  static String email="email";

  static final _box = GetStorage();

  static void saveData(String key, var value) {
    _box.write(key, value);
  }

  static dynamic getData(String key) {
    return _box.read(key);
  }

  static void clearUserData() {
    saveData(userData, null);
  }

  static void clearStorage() {
    _box.erase();
  }
}