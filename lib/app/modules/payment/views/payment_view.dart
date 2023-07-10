import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.addCardFormKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  cardsContainer(),
                  const SizedBox(height: 32),
                  addNewCard(),
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
                  const SizedBox(height: 12),
                  saveCardInfo(),
                  //const SizedBox(height: 18),
                ],
              ),
            ),
            paymentButton(),
          ],
        ),
      ),
    );
  }

  Widget card({cardType, logoUrl, backgroundUrl}) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundUrl),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Mrh Raju",
                  style:
                      Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                const Spacer(),
                Image.asset(logoUrl),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              cardType,
              style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 3),
            Text(
              "5254 **** **** 7690",
              style: Get.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                letterSpacing: 5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "₱3,763.87",
              style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardsContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          card(
            cardType: "Visa Classic",
            logoUrl: "images/visa_white.png",
            backgroundUrl: "images/visa_bg.png",
          ),
          const SizedBox(width: 12),
          card(
            cardType: "Visa Classic",
            logoUrl: "images/master_card.png",
            backgroundUrl: "images/master_card_bg.png",
          ),
        ],
      ),
    );
  }

  Widget addNewCard() {
    return OutlinedButton.icon(
      onPressed: () {
        Get.toNamed(Routes.ADD_CARD);
      },
      icon: const Icon(Icons.add_box_outlined),
      label: const Text(" Add Card"),
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

  Widget saveCardInfo() {
    return Row(
      children: [
        Text(
          "Save card info",
          style: Get.textTheme.bodyLarge,
        ),
        const Spacer(),
        Obx(
          () => Switch(
            value: controller.saveCardInfo.value,
            activeColor: Get.theme.colorScheme.secondary,
            onChanged: (bool value) {
              controller.onSaveCardInfo(value);
            },
          ),
        )
      ],
    );
  }

  Widget paymentButton() {
    return ElevatedButton(
      onPressed: () {
        controller.onAddCard();
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: const Text("Submit Payment"),
    );
  }
}
