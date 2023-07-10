import 'package:ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
