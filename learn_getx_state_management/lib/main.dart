import 'package:flutter/material.dart';
import 'package:learn_getx_state_management/reactive_state_management.dart';
import 'package:learn_getx_state_management/simple_state_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ReactiveStateManagement();
    return const SimpleStateManagement();
  }
}
