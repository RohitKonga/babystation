import 'dart:convert';

import 'package:babystation/core/storage/storage_service.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseURL =
      "https://project.spanchemicalsindia.com/digi/api/";

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body, {
    bool requireAuth = false,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseURL + endpoint),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${StorageService.getToken()}',
          'Accept': 'application/json',
        },

        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data['message'] ?? 'Something Went Wrong');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    bool requireAuth = false,
  }) async {
    final uri = Uri.parse(baseURL + endpoint);
    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        if (requireAuth && StorageService.getToken() != null)
          'Authorization': 'Bearer ${StorageService.getToken()}',
      },
    );
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['Message'] ?? 'Request Failed');
    }
  }
}
