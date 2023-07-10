import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_card_controller.dart';

class AddCardView extends GetView<AddCardController> {
  const AddCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.addCardFormKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            methods(),
            const SizedBox(height: 32),
            cardOwner(),
            const SizedBox(height: 12),
            cardNo(),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: expiration()),
                const SizedBox(width: 12),
                Expanded(child: cvv()),
              ],
            ),
            const SizedBox(height: 18),
            addCardButton(),
          ],
        ),
      ),
    );
  }

  Widget methodButton({logo}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          minimumSize: const Size(50, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: logo,
      ),
    );
  }

  Widget methods() {
    return Row(
      children: [
        methodButton(logo: Image.asset("images/master_card.png")),
        const SizedBox(width: 5),
        methodButton(logo: Image.asset("images/paypal.png")),
        const SizedBox(width: 5),
        methodButton(logo: Image.asset("images/bank.png")),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget cardOwner() {
    return TextFormField(
      controller: controller.cardOwnerController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Card Owner"),
      ),
      validator: (value) => controller.validateCardOwner(value),
    );
  }

  Widget cardNo() {
    return TextFormField(
      controller: controller.cardNoController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Card Number"),
      ),
      validator: (value) => controller.validateCardNo(value),
    );
  }

  Widget expiration() {
    return TextFormField(
      controller: controller.cardNoController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("EXP"),
      ),
      validator: (value) => controller.validateExpiration(value),
    );
  }

  Widget cvv() {
    return TextFormField(
      controller: controller.cardNoController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("CVV"),
      ),
      validator: (value) => controller.validateCVV(value),
    );
  }

  Widget addCardButton() {
    return ElevatedButton(
      onPressed: () {
        controller.onAddCard();
      },
      child: const Text("Add Card"),
    );
  }
}
