import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/add_review_controller.dart';

class AddReviewView extends GetView<AddReviewController> {
  AddReviewView({Key? key}) : super(key: key);

  final InputDecoration customDecoration = InputDecoration(
    filled: true,
    fillColor: const Color(0xFFEDEFF4),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: Color(0xFFF5F6FA),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.reviewFormKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            name(),
            const SizedBox(height: 24),
            review(),
            const SizedBox(height: 12),
            ratingBar(),
            const SizedBox(height: 24),
            submitReview(),
          ],
        ),
      ),
    );
  }

  Widget name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller.nameController,
          decoration: customDecoration,
          validator: (value) => controller.validateName(value),
        ),
      ],
    );
  }

  Widget review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How was your experience ?",
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller.reviewController,
          minLines: 10,
          maxLines: 15,
          decoration: customDecoration,
          validator: (value) => controller.validateReview(value),
        ),
      ],
    );
  }

  Widget ratingBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBar(
          itemPadding: const EdgeInsets.symmetric(horizontal: 6),
          allowHalfRating: false,
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
          onRatingUpdate: (value) {
            controller.onRating(value);
          },
        ),
        Obx(
          () => Visibility(
            visible:
                controller.rating.value == 0 && controller.pristineForm.isFalse,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Text(
                "This field is required",
                style: TextStyle(
                  color: Get.theme.colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget submitReview() {
    return ElevatedButton(
      onPressed: controller.onSubmitReview,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: const Text("Submit Review"),
    );
  }
}
