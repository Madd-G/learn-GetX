import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pagination/common/entity/product.dart';
import 'package:getx_pagination/presentation/view/index.dart';

class HomePage extends GetView<HomeController> {
  final ScrollController _scrollController = ScrollController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollEndNotification &&
              _scrollController.position.extentAfter == 0 &&
              !controller.isLoading &&
              controller.hasMoreData) {
            // Load more data when reaching the end of the list
            controller.fetchData();
          }
          return false;
        },
        child: Obx(
          () {
            if (controller.isLoading && controller.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount:
                  controller.products.length + (controller.hasMoreData ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < controller.products.length) {
                  Product product = controller.products[index];
                  return ListTile(
                    title: Text('ID: ${product.id}'),
                    subtitle: Text('Title: ${product.title}'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: controller.hasMoreData == true
                          ? const CircularProgressIndicator()
                          : const Text("No more data"),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
