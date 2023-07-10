import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  CartView({Key? key}) : super(key: key);

  final circleButton = ElevatedButton.styleFrom(
    minimumSize: const Size(40, 40),
    shape: CircleBorder(
      side: BorderSide(color: Colors.grey.shade200),
    ),
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.white,
    foregroundColor: Get.theme.colorScheme.primary,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  product(),
                  product(),
                  const SizedBox(height: 12),
                  address(),
                  const SizedBox(height: 12),
                  paymentMethod(),
                  orderInfo(),
                ],
              ),
            ),
            checkout(),
          ],
        ),
      ),
    );
  }

  Widget product() {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/product.png",
              scale: 1.8,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Men's Tie-Dye T-Shirt Nike Sportswear",
                    style: Get.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "\₱45 (-\₱4.00 Tax)",
                    style: Get.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  callToAction(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget address() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Get.toNamed(Routes.ADDRESS);
          },
          title: Text(
            "Delivery address",
            style: Get.textTheme.bodyLarge,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
        ListTile(
          leading: Image.asset("images/map.png"),
          title: const Text("Chhatak, Sunamgonj 12/8AB"),
          subtitle: Text(
            "Sylhet",
            style: Get.textTheme.bodySmall,
          ),
          trailing: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget paymentMethod() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Get.toNamed(Routes.PAYMENT);
          },
          title: Text(
            "Payment Method",
            style: Get.textTheme.bodyLarge,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
        ListTile(
          leading: Image.asset("images/visa.png"),
          title: const Text("Visa Classic"),
          subtitle: Text(
            "**** 7690",
            style: Get.textTheme.bodySmall,
          ),
          trailing: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget orderInfo() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Info",
            style: Get.textTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: Get.textTheme.bodySmall,
              ),
              Text(
                "₱1,900.00",
                style: Get.textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping cost",
                style: Get.textTheme.bodySmall,
              ),
              Text(
                "₱50.00",
                style: Get.textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Get.textTheme.bodySmall,
              ),
              Text(
                "₱1,950.00",
                style: Get.textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget callToAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              controller.onDecrement();
            },
            style: circleButton,
            child: const Icon(Icons.remove_outlined),
          ),
        ),
        const SizedBox(width: 12),
        Obx(
          () => Text(
            controller.qty.toString(),
            style: Get.textTheme.labelLarge,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              controller.onIncrement();
            },
            style: circleButton,
            child: const Icon(Icons.add_outlined),
          ),
        ),
        const Spacer(),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: circleButton,
            child: const Icon(Icons.delete_outline),
          ),
        ),
      ],
    );
  }

  Widget checkout() {
    return ElevatedButton(
      onPressed: () {
        Get.dialog(successDialog());
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: const Text("Checkout"),
    );
  }

  Widget successDialog() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Image.asset("images/order_confirmed.png"),
          const SizedBox(height: 12),
          Text(
            "Order Confirmed!",
            style: Get.textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            "Your order has been confirmed, we will send you confirmation email shortly.",
            style: Get.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text("Go to Orders"),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ),
            child: const Text("Continue Shopping"),
          ),
        ],
      ),
    );
  }
}
