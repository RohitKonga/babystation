import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();

  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  static void saveToken(String token) {
    _box.write(_tokenKey, token);
  }

  static String? getToken() {
    return _box.read(_tokenKey);
  }

  static void saveUser(Map<String, dynamic> user) {
    _box.write(_userKey, user);
  }

  static void clear() {
    _box.erase();
  }

  static String? getUserEmail() {
    final user = _box.read(_userKey);
    if (user != null && user['email'] != null) {
      return user['email'];
    }
    return null;
  }

  static String? getUserName() {
    final user = _box.read(_userKey);
    if (user != null && user['name'] != null) {
      return user['name'];
    }
    return null;
  }
}
