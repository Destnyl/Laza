import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final headerTitle = 'Let\'s Get Started';
  final text = "Landing Page";

  redirectToFaceBook() {
    // Get.offAllNamed(Routes.HOME);
  }

  redirectToSignUp() {
    Get.toNamed(Routes.REGISTRATION_FORM);
  }

  redirectToLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
