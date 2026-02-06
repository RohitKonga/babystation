import 'package:babystation/core/network/api_client.dart';

class AuthApi {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> googleLogin({
    required String name,
    required String email,
    required String googleId,
    required String deviceId,
  }) async {
    try {
      return await _apiClient.post('google-login', {
        "name": name,
        "email": email,
        "google_id": googleId,
        "device_id": deviceId,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _apiClient.post('logout', {});
    } catch (e) {
      rethrow;
    }
  }
}
