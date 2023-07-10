import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_form_controller.dart';

class RegistrationFormView extends GetView<RegistrationFormController> {
  const RegistrationFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.registrationFormKey,
        child: Column(
          children: [
            Text("Sign Up", style: Get.textTheme.headlineLarge),
            const Spacer(),
            Expanded(
              flex: 3,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                children: [
                  username(),
                  const SizedBox(height: 12),
                  password(),
                  const SizedBox(height: 12),
                  email(),
                  const SizedBox(height: 12),
                  forgotPassword(),
                  rememberMe(),
                  const SizedBox(height: 24),
                  signupButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget username() {
    return TextFormField(
      controller: controller.usernameController,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: "Username",
      ),
      validator: (value) => controller.validateUsername(value),
    );
  }

  Widget password() {
    return TextFormField(
      controller: controller.passwordController,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      validator: (value) => controller.validatePassword(value),
    );
  }

  Widget email() {
    return TextFormField(
      controller: controller.emailController,
      decoration: const InputDecoration(
        labelText: "Email address",
      ),
      validator: (value) => controller.validateEmail(value),
    );
  }

  Widget forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text('Forgot Password'),
      ),
    );
  }

  Widget rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Remember me'),
        Obx(
          () => Switch(
            value: controller.isRemember.value,
            activeColor: Get.theme.colorScheme.primary,
            onChanged: (bool value) {
              controller.onRememberMe(value);
            },
          ),
        )
      ],
    );
  }

  Widget signupButton() {
    return ElevatedButton(
      onPressed: () {
        controller.onSignup();
      },
      child: const Text("Sign Up"),
    );
  }
}
