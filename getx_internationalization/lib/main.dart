import 'package:flutter/material.dart';
import 'package:getx_internationalization/translations_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TranslationExample(
    );
  }
}