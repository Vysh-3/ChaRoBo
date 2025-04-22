import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';
import '../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 10));
    final isLoggedIn = await Get.find<AuthRepository>().isLoggedIn();
    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.chatbot);
    } else {
      Get.offAllNamed(AppRoutes.welcome);
    }
  }
}