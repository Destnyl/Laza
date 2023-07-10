import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/app/modules/home/models/products_model.dart';
import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/brands_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final baseUrl = dotenv.env["API_BASE_URL"] ?? 'http://localhost:3000';

  final box = GetStorage();
  Dio dio = Dio();

  RxInt selectedIndex = 0.obs;
  List<Product> products = [];
  List<Brand> brands = [];

  RxBool isLoading = false.obs;
  RxBool isBrandLoading = false.obs;

  RxString selectedProductId = ''.obs;

  @override
  onInit() {
    super.onInit();

    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    // ));

    getBrands();
    getProducts();
  }

  onItemTap(value) {
    switch (value) {
      case 1:
        // Get.toNamed(Routes.LANDING);
        break;
      case 2:
        // Get.toNamed(Routes.LANDING);
        break;
      case 3:
        // Get.toNamed(Routes.LANDING);
        break;
      default:
        Get.toNamed(Routes.HOME);
        getProducts();
        break;
    }
  }

  getProducts() async {
    try {
      isLoading(true);
      dio.options.headers['Authorization'] = 'Bearer ${box.read('token')}';
      var res = await dio.get('$baseUrl/products');
      products = productFromJson(jsonEncode(res.data));
      isLoading(false);
    } on DioException catch (e) {
      isLoading(false);

      var error = e.response!.statusMessage;
      Get.snackbar('Failed', error.toString());
    }
  }

  getBrands() async {
    try {
      isBrandLoading(true);
      dio.options.headers['Authorization'] = 'Bearer ${box.read('token')}';
      var res = await dio.get('$baseUrl/brands');
      brands = brandFromJson(jsonEncode(res.data));

      isBrandLoading(false);
    } on DioException catch (e) {
      isBrandLoading(false);

      var error = e.response!.statusMessage;
      Get.snackbar('Failed', error.toString());
    }
  }

  onLogout() async {
    await box.remove('token');
    Get.offAllNamed(Routes.LANDING);
  }

  onSearch() async {
    try {
      isLoading(true);
      dio.options.headers['Authorization'] = 'Bearer ${box.read('token')}';
      var res = await dio.get(
        '$baseUrl/products/search',
        queryParameters: {'name': searchController.text},
      );
      products = productFromJson(jsonEncode(res.data));
      isLoading(false);
    } on DioException catch (e) {
      isLoading(false);

      var error = e.response!.statusMessage;
      Get.snackbar('Failed', error.toString());
    }
  }

  filterByCategory(brandId) async {
    try {
      isLoading(true);
      dio.options.headers['Authorization'] = 'Bearer ${box.read('token')}';
      var res = await dio.get(
        '$baseUrl/products/brand/$brandId',
      );
      products = productFromJson(jsonEncode(res.data));
      isLoading(false);
    } on DioException catch (e) {
      isLoading(false);

      var error = e.response!.statusMessage;
      Get.snackbar('Failed', error.toString());
    }
  }

  onViewProductDetails(id) {
    selectedProductId(id);
    Get.toNamed(Routes.PRODUCT_DETAILS);
  }
}
