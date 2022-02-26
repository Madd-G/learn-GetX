import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // Declare the reactive variable
  final count = 0.obs;

  void increment() {
    count.value++;
  }

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    debugPrint("Controller onInit been called");
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    debugPrint("Controller onReady been called");
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the controller is deleted from memory
    debugPrint("Controller onClose been called");
    super.onClose();
  }
}
