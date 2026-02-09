import 'package:babystation/features/account/model/page_model.dart';
import 'package:babystation/features/account/service/page_api.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  final PageApi _pageApi = PageApi();
  var isLoading = false.obs;
  var pages = <PageModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPages();
  }

  Future<void> fetchPages() async {
    try {
      isLoading.value = true;
      final response = await _pageApi.getPages();
      if (response['Status'] == 200) {
        final List data = response['Data'];
        pages.value = data.map((e) => PageModel.fromJson((e))).toList();
      } else {
        throw Exception(response['Message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getPrivacyPolicy() {
    final privacyPage = pages.firstWhere(
      (page) => page.title == "Privacy Policy",
    );

    return privacyPage.description;
  }

  String getTermsConditions() {
    final tcPage = pages.firstWhere(
      (page) => page.title == "Terms & Conditions",
    );

    return tcPage.description;
  }
}
