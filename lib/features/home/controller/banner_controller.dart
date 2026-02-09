import 'package:babystation/features/home/model/banner_model.dart';
import 'package:babystation/features/home/service/banner_api.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final BannerApi _bannerApi = BannerApi();
  var isLoading = false.obs;
  var bannerList = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    try {
      final response = await _bannerApi.getBanners();

      if (response['Status'] == 200) {
        final List data = response['Data'];

        bannerList.value = data.map((e) => BannerModel.fromJson(e)).toList();
        
      } else {}
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
