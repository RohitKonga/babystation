import 'package:babystation/core/network/api_client.dart';

class BannerApi {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getBanners() async {
    return await _apiClient.get('sliders');
  }
}
