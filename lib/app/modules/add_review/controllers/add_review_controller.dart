import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddReviewController extends GetxController {
  final reviewFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  RxBool pristineForm = true.obs;
  RxDouble rating = 0.0.obs;

  validateName(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
  }

  validateReview(value) {
    pristineForm(false);
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
  }

  onRating(value) {
    rating(value);
  }

  onSubmitReview() {
    if (reviewFormKey.currentState!.validate() && rating.value != 0) {
      var formData = {
        "name": nameController.text,
        "review": reviewController.text,
        "rating": rating.value,
      };
      print(formData);
    }
  }
}
