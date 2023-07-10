import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.headerTitle,
              style: Get.textTheme.headline4,
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.redirectToLogin,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 12),
                    const Text('or'),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: controller.redirectToFaceBook,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF4267B2),
                        side: const BorderSide(color: Color(0xFF4267B2)),
                      ),
                      icon: Image.asset('images/Facebook.png'),
                      label: const Text('Facebook'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      icon: Image.asset('images/Twitter.png'),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1DA1F2),
                        side: const BorderSide(color: Color(0xFF1DA1F2)),
                      ),
                      label: const Text('Twitter'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      icon: Image.asset('images/Google.png'),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFEA4335),
                        side: const BorderSide(color: Color(0xFFEA4335)),
                      ),
                      label: const Text('Google'),
                    ),
                    const SizedBox(height: 12),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTRATION_FORM);
                  },
                  child: const Text('Sign up'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
