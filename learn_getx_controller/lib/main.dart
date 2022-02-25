import 'package:flutter/material.dart';
import 'package:learn_getx_controller/first_screen.dart';
import 'package:learn_getx_controller/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirstScreen();
  }
}