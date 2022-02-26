import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/simple_state_controller.dart';

class SimpleStateManagement extends StatelessWidget {
  const SimpleStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX Simple State Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<SimpleStateController>(
                init: SimpleStateController(),
                builder: ((controller) => Text('${controller.counter}')),
              ),
              GetX<SimpleStateController>(builder: ((controller) => Text(controller.name.value)))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // // 1.
            // Get.find<SimpleStateController>().increment();
            // // 2.
            // final c = Get.find<SimpleStateController>();
            // c.increment();
            // // 3.
            SimpleStateController.to.increment();
          }
        ),
      ),
    );
  }
}
