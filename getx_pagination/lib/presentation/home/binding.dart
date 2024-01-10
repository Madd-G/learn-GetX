import 'package:get/get.dart';
import 'package:getx_pagination/presentation/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
