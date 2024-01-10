import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      onGenerateRoute: AppPages.onGenerateRoute,
      defaultTransition: Transition.noTransition,
    );
  }
}
