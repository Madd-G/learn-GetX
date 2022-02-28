import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_getxservice_getview/service_view.dart';
import 'package:getx_getxservice_getview/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices(); // AWAIT SERVICES INITIALIZATION
  runApp(const MyApp());
}

Future<void> initServices() async {
  debugPrint('starting services...');
  // Here is where you put get_storage, hive, shared_preferences initialization
  // or moor connection, or whatever that's async.
  await Get.putAsync(() => SettingsService().init());
  debugPrint('services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Example();
  }
}
