import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  Rx<DateTime> currentTime = DateTime.now().obs;
  Rx<DateTime> deadline = DateTime.now().add(const Duration(minutes: 30)).obs;
  RxString timerText = ''.obs;
  late StreamSubscription<DateTime> _subscription;

  TimerController() {
    _subscription = Stream.periodic(const Duration(seconds: 1), (i) => DateTime.now())
        .listen((DateTime time) {
      currentTime.value = time;
      updateTimerText();
    });
  }

  void updateTimerText() {
    Duration difference = deadline.value.difference(currentTime.value);
    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    int seconds = difference.inSeconds.remainder(60);
    timerText.value =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}

class TimerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimerController>(() => TimerController());
  }
}

class TimerPage extends GetView<TimerController> {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Deadline: ${controller.deadline.value}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Current Time: ${controller.currentTime.value}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Time Remaining: ${controller.timerText.value}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const TimerPage(),
          binding: TimerBinding(),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MyApp());
}
