import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_pagination/presentation/home/index.dart';
import 'package:http/http.dart' as http;
import 'package:getx_pagination/common/entity/product.dart';

class HomeController extends GetxController {
  HomeState state = HomeState();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      state.isLoading = true;
      update();

      Uri uri = Uri.parse(
          "https://dummyjson.com/products?${state.limit}=25&skip=${state.skip * 25}");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<Product> newProducts = List<Product>.from(
          body["products"].map((x) => Product.fromJson(x)),
        );
        state.products.addAll(newProducts);

        // If the loaded data is less than the limit, there's no more data
        if (newProducts.length < 10) {
          state.hasMoreData = false;
        }

        state.skip++;
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    } finally {
      state.isLoading = false;
      update();
    }
  }
}
