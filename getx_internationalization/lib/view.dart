import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_internationalization/translations_controller.dart';

class View extends StatelessWidget {
  View({Key? key}) : super(key: key);

  final messageController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    var products = <String>[];
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Internationalization'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello'.tr,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'logged_in'.trParams(
                  {'name': 'Alamsyah', 'email': 'alamsyah@gmail.com'}),
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () =>
                  messageController.changeLanguage('en_US', 'id'),
              child: const Text('English'),
            ), ElevatedButton(
              onPressed: () =>
                  messageController.changeLanguage('id', 'en_US'),
              child: const Text('Indonesia'),
            ),
          ],
        ),
      ),
    );
  }
}
