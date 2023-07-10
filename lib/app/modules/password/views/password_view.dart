import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  pageTitle(),
                  const SizedBox(
                    height: 150,
                  ),
                  password(),
                  const SizedBox(
                    height: 12,
                  ),
                  confirmPassword(),
                ],
              ),
            ),
            passwordReminder(),
            const SizedBox(
              height: 12,
            ),
            resetBtn(),
          ],
        ),
      ),
    );
  }

  Widget password() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }

  Widget confirmPassword() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }

  Widget pageTitle() {
    return Text(
      'New Password',
      style: Get.textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }

  Widget passwordReminder() {
    return const Text('Please write your new password.');
  }

  Widget resetBtn() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Reset Password'),
    );
  }
}
