import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verification_controller.dart';
import 'package:pinput/pinput.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            pageTitle(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  logo(),
                  pinInput(),
                ],
              ),
            ),
            resendTimer(),
            const SizedBox(
              height: 12,
            ),
            confirmBtn()
          ],
        ),
      ),
    );
  }

  Widget pageTitle() {
    return Text(
      'Verification Code',
      style: Get.textTheme.headline4,
    );
  }

  Widget logo() {
    return Image.asset('images/forgot.png');
  }

  Widget pinForm() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget resendTimer() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('00:20 ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text(
          'resend confirmation code.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget pinInput() {
    return Pinput(
      keyboardType: TextInputType.number,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      validator: (value) {
        return value == '2222' ? null : 'Invalid OTP';
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: const Color(0xFF4267B2),
          ),
        ],
      ),
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(
      onPressed: () {
        controller.startTimer();
      },
      child: const Text('Confirm Code'),
    );
  }
}
