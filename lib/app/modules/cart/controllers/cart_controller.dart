import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt qty = 1.obs;

  final count = 0.obs;

  onIncrement() {
    qty.value++;
  }

  onDecrement() {
    qty.value--;
  }
}
