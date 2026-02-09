import 'package:babystation/core/network/api_client.dart';

class FaqsApi {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getFaqs() async {
    return await _apiClient.get('faqs');
  }
}
