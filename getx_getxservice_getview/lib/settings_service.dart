import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService {
  late SharedPreferences _prefs;
  final counter = 0.obs;

  Future<SettingsService> init() async {
    debugPrint('$runtimeType initialize shared preferences');
    _prefs = await SharedPreferences.getInstance();
    debugPrint('$runtimeType shared preferences ready!');
    counter.value = (_prefs.getInt('counter') ?? 0);
    return this;
  }

  Future<void> incrementCounter() async {
    counter.value = (_prefs.getInt('counter')!) + 1;
    _prefs.setInt('counter', counter.value);
  }
}
