import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  RxInt increment() => count++;
}
