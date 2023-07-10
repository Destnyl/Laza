import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardController extends GetxController {
  final addCardFormKey = GlobalKey<FormState>();
  TextEditingController cardOwnerController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  validateCardOwner(value) {}

  validateCardNo(value) {}

  validateExpiration(value) {}

  validateCVV(value) {}

  onAddCard() {
    if (addCardFormKey.currentState!.validate()) {}
  }
}
