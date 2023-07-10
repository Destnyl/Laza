import 'dart:async';
import 'dart:developer';

import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final _start = 20.obs;

  void startTimer() {
    Get.toNamed(Routes.PASSWORD);
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start.value == 0) {
          timer.cancel();
        } else {
          _start.value--;
          log(' $_start');
        }
      },
    );
  }
}
