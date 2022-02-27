import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_internationalization/messages.dart';
import 'package:getx_internationalization/view.dart';

class TranslationExample extends StatelessWidget {
  const TranslationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // use custom translations
      translations: Messages(),
      // translations will be displayed in the locale
      locale: const Locale('id', 'ID'),
      // system locale
      // locale: Get.deviceLocale,
      // specify the fallback locale in case an invalid locale
      fallbackLocale: const Locale('id', 'ID'),
      home: View(),
    );
  }
}
