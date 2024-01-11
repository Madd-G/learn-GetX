import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pagination/common/entity/product.dart';
import 'package:getx_pagination/presentation/home/index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.state.isLoading && controller.state.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: controller.scroll,
            itemCount: controller.state.products.length +
                (controller.state.hasMoreData ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.state.products.length) {
                final Product product = controller.state.products[index];
                return ListTile(
                  title: Text('ID: ${product.id}'),
                  subtitle: Text('Title: ${product.title}'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: controller.state.hasMoreData
                        ? const CircularProgressIndicator()
                        : const Text("No more data"),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
