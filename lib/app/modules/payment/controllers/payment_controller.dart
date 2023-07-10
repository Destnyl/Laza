import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final addCardFormKey = GlobalKey<FormState>();
  TextEditingController cardOwnerController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  RxBool saveCardInfo = true.obs;

  validateCardOwner(value) {}

  validateCardNo(value) {}

  validateExpiration(value) {}

  validateCVV(value) {}

  onSaveCardInfo(value) {
    saveCardInfo.value = !saveCardInfo.value;
  }

  onAddCard() {
    if (addCardFormKey.currentState!.validate()) {}
  }
}
