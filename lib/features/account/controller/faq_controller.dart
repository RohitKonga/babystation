import 'package:babystation/features/account/model/faq_model.dart';
import 'package:babystation/features/account/service/faqs_api.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  final FaqsApi _faqsApi = FaqsApi();
  var isLoading = false.obs;
  var faqList = <FaqCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFaqs();
  }

  Future<void> fetchFaqs() async {
    try {
      isLoading.value = true;
      final response = await _faqsApi.getFaqs();
      if (response['Status'] == 200) {
        final List data = response['Data'];
        faqList.value = data.map((e) => FaqCategory.fromJson(e)).toList();
      } else {
        throw Exception(response['Message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
