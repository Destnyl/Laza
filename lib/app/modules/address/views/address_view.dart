import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              key: controller.addressFormKey,
              padding: const EdgeInsets.all(12),
              children: [
                name(),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: country()),
                    const SizedBox(width: 12),
                    Expanded(child: city()),
                  ],
                ),
                const SizedBox(height: 12),
                phoneNo(),
                const SizedBox(height: 12),
                address(),
                const SizedBox(height: 12),
                saveAsPrimaryAddress(),
                const SizedBox(height: 18),
              ],
            ),
          ),
          saveAddress(),
        ],
      ),
    );
  }

  Widget name() {
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Name"),
      ),
      validator: (value) => controller.validateName(value),
    );
  }

  Widget country() {
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Country"),
      ),
      validator: (value) => controller.validateCountry(value),
    );
  }

  Widget city() {
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("City"),
      ),
      validator: (value) => controller.validateCity(value),
    );
  }

  Widget phoneNo() {
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Phone Number"),
      ),
      validator: (value) => controller.validatePhoneNo(value),
    );
  }

  Widget address() {
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Address"),
      ),
      validator: (value) => controller.validateAddress(value),
    );
  }

  Widget saveAsPrimaryAddress() {
    return Row(
      children: [
        Text(
          "Save as primary address",
          style: Get.textTheme.bodyLarge,
        ),
        const Spacer(),
        Obx(
          () => Switch(
            value: controller.saveAsPrimaryAddress.value,
            activeColor: Get.theme.colorScheme.secondary,
            onChanged: (bool value) {
              controller.onSaveAsPrimaryAddress(value);
            },
          ),
        )
      ],
    );
  }

  Widget saveAddress() {
    return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: const Text("Save Address"),
    );
  }
}
