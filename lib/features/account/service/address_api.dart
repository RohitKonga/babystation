import 'package:babystation/core/network/api_client.dart';

class AddressApi {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> addAddress({
    required String name,
    required String phone,
    required String address1,
    required String address2,
    required String city,
    required String pincode,
    String? landmark,
    required String isDefault,
  }) async {
    return await _apiClient.post('checkout/address/add', {
      "name": name,
      "phone_no": phone,
      "address_line_1": address1,
      "address_line_2": address2,
      "city": city,
      "pincode": pincode,
      "landmark": landmark ?? "",
      "default": isDefault,
    });
  }

  Future<Map<String, dynamic>> getAddressList() async {
    return await _apiClient.get('checkout/address/list', requireAuth: true);
  }

  Future<Map<String, dynamic>> applyAddress(int addressId) async {
    return await _apiClient.post('checkout/address/apply', {
      "user_address_id": addressId,
    }, requireAuth: true);
  }
}
