import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_change_theme/themes_example.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeExample();
  }
}