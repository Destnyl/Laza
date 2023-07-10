import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce/app/modules/product_details/models/product_details_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductDetailsController extends GetxController {
  var home = Get.find<HomeController>();
  final baseUrl = dotenv.env["API_BASE_URL"] ?? 'http://localhost:3000';
  final box = GetStorage();
  late ProductDetails productDetails;

  Dio dio = Dio();

  Future getProductDetails() async {
    try {
      dio.options.headers['Authorization'] = 'Bearer ${box.read('token')}';
      var res = await dio.get('$baseUrl/products/${home.selectedProductId}');

      productDetails = productDetailsFromJson(jsonEncode(res.data));
      return productDetails;
    } on DioException catch (e) {
      var error = e.response!.statusMessage;
      Get.snackbar('Failed', error.toString());
    }
  }
}
