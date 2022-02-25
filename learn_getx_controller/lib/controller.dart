import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get controller => Get.find();

  // reactive
  // var num = 0.obs;
  //
  // increment() {
  //   num = num++;
  // }

// // simple state management
  int num = 0;

  add() {
    num++;
    // update();
    // update(['id1']);
    // update(['id1'], num < 5);
    update(['id1', 'id2'], num < 5);
    // update(['id2']);
  }

  @override
  void onInit() {
    debugPrint("onInit been called");
    super.onInit();

    // // Called every time num changed
    // ever(num, (_) => debugPrint("$_ has been changed"));
    // everAll([num], (_) => debugPrint("$_ has been changed"));

    // // Called only first time the variable changed
    // once(num, (_) => debugPrint("$_ was changed once"));

    // // Called every time the user stops typing for 1000 milliseconds
    // debounce(num, (_) => debugPrint("debounce $_"),
    //     time: const Duration(milliseconds: 1000));

    // Ignore all changes within 1000 milliseconds
    // for search bar etc
  //   interval(num, (_) => debugPrint("interval $_"),
  //   time: const Duration(milliseconds: 1000));
  }

  @override
  void onReady() {
    debugPrint("onReady been called");
    super.onReady();
  }

  @override
  void onClose() {
    debugPrint("onClosed been called");
    super.onClose();
  }
}
