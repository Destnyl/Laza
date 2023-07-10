import 'package:get/get.dart';

import '../controllers/registration_form_controller.dart';

class RegistrationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationFormController>(
      () => RegistrationFormController(),
    );
  }
}
