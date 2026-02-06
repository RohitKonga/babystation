import 'package:babystation/core/storage/storage_service.dart';
import 'package:babystation/core/utils/device_utils.dart';
import 'package:babystation/features/auth/model/user_model.dart';
import 'package:babystation/features/auth/service/auth_api.dart';
import 'package:babystation/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final AuthApi _authApi = AuthApi();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    _loadUserFromStorage();
  }

  bool get isLoggedIn {
    return StorageService.getToken() != null &&
        StorageService.getToken()!.isNotEmpty;
  }

  void _loadUserFromStorage() {
    final email = StorageService.getUserEmail();
    final name = StorageService.getUserName();

    if (email != null && name != null) {
      user.value = UserModel(id: '', name: name, email: email);
    }
  }

  Future<void> signInWithGoogle() async {
    final deviceId = await DeviceUtils.getDeviceId();

    try {
      errorMessage.value = '';
      isLoading.value = true;

      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final response = await _authApi.googleLogin(
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        googleId: googleUser.id.toString(),
        deviceId: deviceId.toString(),
      );

      if (response['Status'] == 200) {
        final data = response['Data'];
        final userJson = data['user'];
        final token = data['token'];

        StorageService.saveToken(token);

        StorageService.saveUser(userJson);

        user.value = UserModel.fromJson(userJson);

        Get.offAllNamed(Routes.home);
      } else {
        throw Exception(response['Message'] ?? 'Login Failed');
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar("Login Failed", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await _authApi.logout();
    } catch (e) {
      Get.snackbar("Warning", "Logged Out Successfull");
    } finally {
      StorageService.clear();
      user.value = null;
      Get.offAllNamed(Routes.home);
      isLoading.value = false;
    }
  }
}
