import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final GlobalKey addressFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxBool saveAsPrimaryAddress = true.obs;

  validateName(value) {}

  validateCountry(value) {}

  validateCity(value) {}

  validatePhoneNo(value) {}

  validateAddress(value) {}

  onSaveAsPrimaryAddress(value) {
    saveAsPrimaryAddress.value = !saveAsPrimaryAddress.value;
  }
}
