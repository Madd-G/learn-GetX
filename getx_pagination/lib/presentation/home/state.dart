import 'package:get/get.dart';
import 'package:getx_pagination/common/entity/product.dart';

class HomeState {
  RxList<Product> products = <Product>[].obs;
  RxInt skip = 0.obs;
  RxInt limit = 25.obs;
  bool isLoading = false;
  bool hasMoreData = true;
}
