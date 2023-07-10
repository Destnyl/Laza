import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationFormController extends GetxController {
  final registrationFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final isRemember = true.obs;
  Dio dio = Dio();

  validateUsername(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
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

  validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (!GetUtils.isEmail(value)) {
      return 'enter a valid email';
    }
    return null;
  }

  onRememberMe(value) {
    isRemember.value = !isRemember.value;
  }

  onSignup() async {
    if (registrationFormKey.currentState!.validate()) {
      var formData = {
        'username': usernameController.text,
        'password': passwordController.text,
        'email': emailController.text,
      };

      try {
        await dio.post(
          'http://localhost:3000/auth/signup',
          data: formData,
        );
        Get.toNamed(Routes.LOGIN);
      } on DioException catch (e) {
        print(e.response);
      }
    }
  }
}
