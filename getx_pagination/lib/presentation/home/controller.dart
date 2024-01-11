import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_pagination/presentation/home/index.dart';
import 'package:http/http.dart' as http;
import 'package:getx_pagination/common/entity/product.dart';

class HomeController extends GetxController with ScrollMixin {
  final HomeState state = HomeState();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  Future<void> onEndScroll() async {
    await fetchData();
  }

  @override
  Future<void> onTopScroll() async {
    await fetchData();
  }

  Future<void> fetchData() async {
    try {
      state.isLoading = true;

      Uri uri = Uri.parse(
          "https://dummyjson.com/products?limit=${state.limit}&skip=${state.skip * 25}");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<Product> newProducts = List<Product>.from(
          body["products"].map((x) => Product.fromJson(x)),
        );

        state.products.addAll(newProducts);

        if (newProducts.length < state.limit.value) {
          state.hasMoreData = false;
        }

        state.skip++;
        // update();
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    } finally {
      state.isLoading = false;
      // update();
    }
  }
}
