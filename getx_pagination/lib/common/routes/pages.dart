import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pagination/presentation/home/index.dart';
import 'names.dart';

class AppPages {
  static const initial = AppRoute.home;

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == initial) {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        binding: HomeBinding(),
      );
    }

    return null;
  }
}
