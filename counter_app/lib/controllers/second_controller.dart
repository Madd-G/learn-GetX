import 'package:counter_app/controllers/controller.dart';
import 'package:get/get.dart';

class SecondController extends GetxController {
  final Controller c = Get.put(Controller());

  decrement() => c.count--;

}
