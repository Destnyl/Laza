import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailField = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  onConfirmEmail() {
    if (emailField.currentState!.validate()) {}
  }

  validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      Get.toNamed(Routes.VERIFICATION);
    }

    if (!GetUtils.isEmail(value)) {
      return 'Invalid email address';
    }
    return null;
  }
}
