import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/reviews_controller.dart';

class ReviewsView extends GetView<ReviewsController> {
  const ReviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: Column(
        children: [
          header(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
                const SizedBox(height: 18),
                reviews(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("245 Reviews", style: Get.textTheme.labelLarge),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("4.0", style: Get.textTheme.labelMedium),
                    const SizedBox(width: 3),
                    ratingBar(rating: 4),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.border_color, size: 14),
              label: const Text("Add Review", style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 40),
                backgroundColor: Get.theme.colorScheme.secondary,
              ),
              onPressed: () {
                Get.toNamed(Routes.ADD_REVIEW);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget reviews() {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 8),
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
                      size: 14,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "13 Sep, 2020",
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: '4.8 ',
                    style: Get.textTheme.labelLarge,
                    children: [
                      TextSpan(
                        text: 'rating',
                        style: Get.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                ratingBar(rating: 4),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
          style: TextStyle(
            color: Color(0xff8f959e),
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget ratingBar({double rating = 0.0}) {
    return RatingBar(
      itemSize: 14,
      allowHalfRating: true,
      initialRating: rating,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.orange,
        ),
        half: const Icon(Icons.star),
        empty: Icon(
          Icons.star,
          color: Colors.orange.shade100,
        ),
      ),
      onRatingUpdate: (value) {},
    );
  }
}
