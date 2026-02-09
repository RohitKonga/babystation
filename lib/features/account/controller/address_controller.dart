import 'package:babystation/features/account/model/address_model.dart';
import 'package:babystation/features/account/service/address_api.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final AddressApi _addressApi = AddressApi();

  var isLoading = false.obs;
  var addressList = <AddressModel>[].obs;
  var selectedAddressId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddress();
  }

  Future<void> addAddress({
    required String name,
    required String phone,
    required String address1,
    required String address2,
    required String city,
    required String pincode,
    String? landmark,
    required bool isDefault,
  }) async {
    try {
      final response = await _addressApi.addAddress(
        name: name,
        phone: phone,
        address1: address1,
        address2: address2,
        city: city,
        pincode: pincode,
        isDefault: isDefault ? "1" : "0",
      );

      if (response['Status'] == 200) {
        Get.snackbar("Success", "Address Added");
        await fetchAddress();
        Get.back(result: true);
      } else {
        throw Exception(response['Message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAddress() async {
    try {
      isLoading.value = true;
      final response = await _addressApi.getAddressList();

      if (response['Status'] == 200) {
        final List data = response['Data'];

        addressList.value = data.map((e) => AddressModel.fromJson(e)).toList();
        final defaultAddress = addressList.firstWhere(
          (e) => e.isDefault,
          orElse: () => addressList.first,
        );

        selectedAddressId.value = defaultAddress.id;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> applySelectedAddress() async {
    try {
      isLoading.value = true;

      final selectedAddress = addressList.firstWhere(
        (e) => e.id == selectedAddressId.value,
      );

      final response = await _addressApi.applyAddress(selectedAddress.id);

      if (response['Status'] == 200) {
        await fetchAddress();
        Get.back(result: selectedAddress);
      } else {
        throw Exception(response['Message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void selectAddress(int addressId) {
    selectedAddressId.value = addressId;
  }
}
