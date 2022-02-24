import 'package:get/get.dart';

class Controller extends GetxController {

  RxInt count = 0.obs;
  increment() => count++;

  var isDark = false.obs;

  changeTheme() => isDark.value = !isDark.value;
}
