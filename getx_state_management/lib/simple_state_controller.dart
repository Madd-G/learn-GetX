import 'package:get/get.dart';

class SimpleStateController extends GetxController {
  static SimpleStateController get to => Get.find();

  int counter = 0;
  final name = "Alamsyah".obs;

  void increment() {
    counter++;
    // use update() to update counter variable
    // on UI when increment be called
    update();
  }
}

