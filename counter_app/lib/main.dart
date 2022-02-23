import 'package:counter_app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  final c = Get.put(Controller());

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Number: ${c.count.value}"),
                  ElevatedButton(
                    onPressed: () => Get.to(() => SecondPage()),
                    child: const Text("Next"),
                  )
                ],
              ))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => c.increment()),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Controller c = Get.find();

  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${c.count}"),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
