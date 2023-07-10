import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Form(
        key: controller.emailField,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  headerTitle(),
                  forgotPasswordLogo(),
                  email(),
                  const SizedBox(height: 20),
                  confirm(),
                ],
              ),
            ),
            reminder(),
          ],
        ),
      ),
    );
  }

  Widget headerTitle() {
    return Text(
      'Forgot Password',
      style: Get.textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }

  Widget forgotPasswordLogo() {
    return Image.asset('images/forgot.png');
  }

  Widget email() {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Email Address',
      ),
      validator: (value) => controller.validateEmail(value),
    );
  }

  Widget reminder() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Please write your email to receive a confirmation code to set a new password.',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget confirm() {
    return ElevatedButton(
      onPressed: controller.onConfirmEmail,
      child: const Text('Confirm Mail'),
    );
  }
}
