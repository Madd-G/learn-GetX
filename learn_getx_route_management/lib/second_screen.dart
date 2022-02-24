import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('arguments: ${Get.arguments}'),
            Text('arguments: ${Get.parameters['id']}'),
            Text('arguments: ${Get.parameters['name']}'),
            ElevatedButton(onPressed: () {
              Get.back(
                result: 'success'
              );
            }, child: const Text("Back")),
          ],
        ),
      ),
    );
  }
}
