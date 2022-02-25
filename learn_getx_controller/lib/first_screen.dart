import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_controller/controller.dart';
import 'package:learn_getx_controller/second_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  // reactive
  // final Controller c = Get.put<Controller>(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Screen"),
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
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       GetBuilder<Controller>(
        //         init: Controller(),
        //         id: 'id1',
        //         builder: ((controller) => Text("${controller.num}"))
        //       ),
        //       GetBuilder<Controller>(
        //         id: 'id2',
        //           builder: ((controller) => Text("${controller.num}"))
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     // reactive
        //     // c.increment();
        //
        //     // // simple state management
        //     Controller.controller.add();
        //   },
        // ),
        Center(
          child: ElevatedButton(
            child: const Text("Go to Second Screen"),
            onPressed: () => Get.to(() => SecondScreen()),
          ),
        )
      ),
    );
  }
}
