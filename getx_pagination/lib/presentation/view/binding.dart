import 'package:get/get.dart';
import 'package:getx_pagination/presentation/view/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
