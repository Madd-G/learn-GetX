import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:getx_pagination/common/entity/product.dart';

class HomeController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxInt skip = 0.obs;
  bool isLoading = false;
  bool hasMoreData = true;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;
      update();

      Uri uri = Uri.parse(
          "https://dummyjson.com/products?limit=25&skip=${skip * 25}");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<Product> newProducts = List<Product>.from(
          body["products"].map((x) => Product.fromJson(x)),
        );
        products.addAll(newProducts);

        // If the loaded data is less than the limit, there's no more data
        if (newProducts.length < 10) {
          hasMoreData = false;
        }

        skip++;
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    } finally {
      isLoading = false;
      update();
    }
  }
}
