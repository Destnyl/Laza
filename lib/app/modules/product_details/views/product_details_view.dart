import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.getProductDetails();
            },
            child: const Icon(Icons.refresh_outlined)),
        body: FutureBuilder(
            future: controller.getProductDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return detailsPage();
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }

  Widget header() {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Men's Printed Pullover Hoodie",
                style: Get.textTheme.bodySmall,
              ),
              const SizedBox(height: 3),
              Text(
                controller.productDetails.name,
                style: Get.textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Price", style: Get.textTheme.bodySmall),
            const SizedBox(height: 3),
            Text("\$${controller.productDetails.price}",
                style: Get.textTheme.titleLarge),
          ],
        ),
      ],
    );
  }

  Widget productPhotos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          controller.productDetails.imageUrl,
          height: 80,
          fit: BoxFit.fill,
        ),
        Image.asset(
          controller.productDetails.imageUrl,
          height: 80,
          fit: BoxFit.fill,
        ),
        Image.asset(
          controller.productDetails.imageUrl,
          height: 80,
          fit: BoxFit.fill,
        ),
        Image.asset(
          controller.productDetails.imageUrl,
          height: 80,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  Widget sizes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Size", style: Get.textTheme.titleSmall),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text("Size Guide", style: Get.textTheme.bodySmall),
            ),
          ],
        ),
        Row(
          children: [
            sizeButton(desc: "S"),
            const SizedBox(width: 5),
            sizeButton(desc: "M"),
            const SizedBox(width: 5),
            sizeButton(desc: "L"),
            const SizedBox(width: 5),
            sizeButton(desc: "XL"),
            const SizedBox(width: 5),
            sizeButton(desc: "2XL"),
          ],
        ),
      ],
    );
  }

  Widget sizeButton({desc}) {
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
        child: Text(
          desc,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: Get.textTheme.titleSmall),
        const SizedBox(height: 12),
        Text(
          controller.productDetails.description,
          style: Get.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget reviews() {
    return Column(
      children: [
        Row(
          children: [
            Text("Reviews", style: Get.textTheme.titleSmall),
            const Spacer(),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.REVIEWS);
              },
              child: const Text("View All"),
            ),
          ],
        ),
        Row(
          children: [
            const CircleAvatar(child: Text("PB")),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenny Wilson",
                  style: Get.textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "13 Sep, 2020",
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
          style: Get.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget price() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Price", style: Get.textTheme.titleSmall),
            Text("with VAT,SD", style: Get.textTheme.bodySmall),
          ],
        ),
        const Spacer(),
        Text("\$125", style: Get.textTheme.labelLarge),
      ],
    );
  }

  Widget addToCart() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(Routes.CART);
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: const Text("Add to Cart"),
    );
  }

  Widget detailsPage() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              Image.asset(
                controller.productDetails.imageUrl,
                height: 200,
              ),
              const SizedBox(height: 12),
              header(),
              const SizedBox(height: 12),
              productPhotos(),
              sizes(),
              const SizedBox(height: 12),
              description(),
              const SizedBox(height: 12),
              reviews(),
              const SizedBox(height: 12),
              price(),
            ],
          ),
        ),
        addToCart(),
      ],
    );
  }
}
