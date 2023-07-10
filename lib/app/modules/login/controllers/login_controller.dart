import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController =
      TextEditingController(text: 'SampleUser');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@123');

  final passwordVisible = true.obs;
  final isRemember = true.obs;
  final isLoading = false.obs;

  Dio dio = Dio();

  final box = GetStorage();

  showPassword() {
    passwordVisible.value = !passwordVisible.value;
  }

  savedCredential(value) {
    isRemember.value = !isRemember.value;
  }

  onLogin() async {
    if (loginFormKey.currentState!.validate()) {
      var formData = {
        'username': usernameController.text,
        'password': passwordController.text,
        'isRemember': isRemember.value
      };

      try {
        isLoading.value = true;
        var response = await dio.post(
          '${dotenv.env["API_BASE_URL"]}/auth/login',
          data: formData,
        );

        await box.write('token', response.data['access_token']);
        print(response.data['access_token']);
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME);
      } on DioException catch (e) {
        isLoading.value = false;
      }
    }
  }

  validateUsername(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter username';
    }

    return null;
  }

  validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (!GetUtils.hasCapitalletter(value)) {
      return 'password should have a Capital Letter';
    }

    if (GetUtils.isAlphabetOnly(value)) {
      return 'password should contain number';
    }

    if (!GetUtils.isLengthGreaterOrEqual(value, 8)) {
      return 'password should be 8 characters';
    }
    return null;
  }

  onForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }
}
