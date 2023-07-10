import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.loginFormKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            headerTitle(),
            const SizedBox(height: 50),
            username(),
            const SizedBox(height: 12),
            password(),
            rememberMe(),
            const SizedBox(height: 12),
            loginButton(),
            forgotPassword(),
            termsAndCondtion(),
          ],
        ),
      ),
    );
  }

  Widget headerTitle() {
    return Column(
      children: [
        Text(
          'Welcome',
          style: Get.textTheme.headline3,
        ),
        Text(
          'Please enter your data to continue',
          style: Get.textTheme.caption,
        ),
      ],
    );
  }

  Widget username() {
    return TextFormField(
        controller: controller.usernameController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Username',
        ),
        validator: (value) => controller.validateUsername(value));
  }

  Widget password() {
    return Obx(
      () => TextFormField(
          controller: controller.passwordController,
          obscureText: controller.passwordVisible.value,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(controller.passwordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: controller.showPassword,
            ),
          ),
          validator: (value) => controller.validatePassword(value)),
    );
  }

  Widget forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: controller.onForgotPassword,
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
              controller.savedCredential(value);
            },
          ),
        )
      ],
    );
  }

  Widget loginButton() {
    return Obx(() => Visibility(
          visible: controller.isLoading.isFalse,
          replacement: ElevatedButton(
            onPressed: () {},
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          ),
          child: ElevatedButton(
            onPressed: controller.onLogin,
            child: const Text('Login'),
          ),
        ));
  }

  Widget termsAndCondtion() {
    return Text(
      'By connecting your account confirm that you agree with our Term and Condition',
      textAlign: TextAlign.center,
      style: Get.textTheme.caption,
    );
  }
}
