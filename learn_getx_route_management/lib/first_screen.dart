import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_route_management/second_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const FirstScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const FirstScreen()),
        GetPage(name: '/second_screen', page: () => const SecondScreen()),
      ],

      // middleware
      routingCallback: (routing) {
        if (routing!.current == '/second_screen') {
          debugPrint('Open Ads');
        }
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Get.to(() => const SecondScreen(), arguments: 'From Get.to(() => const SecondScreen())');
            }, child: const Text("Get.to()")),

            ElevatedButton(onPressed: () async{
              var data = await  Get.to(() => const SecondScreen(), arguments: 'From Get.to(() => const SecondScreen())');
              debugPrint(data);
            }, child: const Text("Get.to()")),

            ElevatedButton(onPressed: () {
              Get.off(() => const SecondScreen(), arguments: 'From Get.off(() => const SecondScreen())');
            }, child: const Text("Get.off()")),

            ElevatedButton(onPressed: () {
              Get.toNamed("/second_screen", arguments: 'From Get.toNamed("/second_screen")');
            }, child: const Text('Get.toNamed("/second_screen")')),

            ElevatedButton(onPressed: () {
              Get.toNamed("/second_screen?id=123", arguments: 'From Get.toNamed("/second_screen?id=123")');
            }, child: const Text('Get.toNamed("/second_screen?id=123")')),

            ElevatedButton(onPressed: () {
              Get.toNamed("/second_screen?id=123&name=albert", arguments: 'From Get.toNamed("/second_screen?id=123&name=albert")');
            }, child: const Text('Get.toNamed/second_screen?id=123&name=albert")')),

            ElevatedButton(onPressed: () {
              Get.offNamed("/second_screen?id=123", arguments: 'From Get.offNamed("/second_screen?id=123")');
            }, child: const Text('Get.offNamed("/second_screen?id=123")')),
          ],
        ),
      ),
    );
  }
}
