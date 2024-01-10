import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pagination/presentation/view/index.dart';
import 'names.dart';

class AppPages {
  static const initial = AppRoute.home;
  static const second = '/second';

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == initial) {
      return GetPageRoute(
        settings: settings,
        page: () => HomePage(),
        binding: HomeBinding(),
      );
    }

    return null;
  }
}
