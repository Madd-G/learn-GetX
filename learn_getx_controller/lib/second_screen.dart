import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_controller/controller.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  // reactive
  // final Controller c = Get.put<Controller>(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body:
          // // reactive approach
          // // 1.
          //     Obx(() => Center(
          //       child: Text("num: ${c.num.value}"),),),

          // // 2.
          //     Center(
          //       child: GetX<Controller>(
          //         init: Controller(),
          //         builder: (controller) => Text("num: ${controller.num.value}")),
          // ),

          // // simple state management
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                init: Controller(),
                id: 'id1',
                builder: ((controller) => Text("${controller.num}"))),
            GetBuilder<Controller>(
                id: 'id2',
                builder: ((controller) => Text("${controller.num}"))),
            ElevatedButton(onPressed: () => Get.back(), child: const Text("Back"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // reactive
          // c.increment();

          // // simple state management
          Controller.controller.add();
        },
      ),
    );
  }
}
