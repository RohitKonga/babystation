import 'package:babystation/core/network/api_client.dart';

class PageApi {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getPages() async {
    return await _apiClient.get('pages');
  }
}
