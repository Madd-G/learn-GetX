import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user.dart';

class ReactiveStateManagement extends StatelessWidget {
  ReactiveStateManagement({Key? key}) : super(key: key);

  // // 1. using Rx(Type)
  // final name = RxString('');
  // final isLogged = RxBool(true);
  // final items = RxList<String>([]);
  // final myMap = RxMap<String, int>({});

  // // 2. using Rx and Darts Generics, Rx<Type>
  // final name = Rx<String>('');
  // final isLogged = Rx<Bool>(true);
  // final items = Rx<List<String>>([]);
  // final myMap = Rx<Map<String, int>>({});
  // final user = Rx<User>(User());
  // final user = Rx<User>(User(name: "Alamsyah", age: 21));

  // 3. more practical, easier, and prefer approach
  final name = 'Alamsyah'.obs;
  // final isLogged = true.obs;
  final count = 0.obs;
  // final items = <String>[].obs;
  // final myMap = <String, int>{}.obs;
  final user = User(name: 'Alamsyah', age: 21).obs;
  // final user = User(name: 'Alamsyah', age: 21).obs;

  void increment() => count.value++;

  void toUpper() {
    // // Attribute inside User class is observer
    // user.name.value = user.name.value.toUpperCase();
    // user.age.value++;

    // // Entire class is observe
    // // 1. Using update method
    user.update((user) {
      user!.name = user.name.toUpperCase();
      user.age = user.age + 1;
      // user.age = user.age++; // can't use this
    });

    // // 2. An alternative way of update the user variable
    // user(User(name: 'Alamsyah'));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX Reactive State"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obx(
              //     () => Column(
              //       children: [
              //         Text('${count.value}',
              //         style: const TextStyle(
              //           fontSize: 28
              //         ),
              //         ),
              //       ],
              //     )
              // )
              Obx(() => Column(
                    children: [
                      Text(
                        '${user.value.name} ${user().age}',
                        style: const TextStyle(fontSize: 28),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () => increment(),
        // ),
        // // Attribute inside User class is observer
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_upward),
          onPressed: () => toUpper(),
        ),
      ),
    );
  }
}
