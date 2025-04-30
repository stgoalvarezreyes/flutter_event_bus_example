import 'package:example_event_bus/controller/product_list_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductListController());
    return Obx((() {
      return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.items[index].productName),
            subtitle: Text('ID: ${controller.items[index].productId}'),
            trailing: Text('Qty: ${controller.items[index].quantity}'),
            leading: IconButton(
              onPressed:
                  () => showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('Delete ${controller.items[index].productName}'),
                          content: const Text('Are you sure you want to delete this product?'),
                          actions: [
                            MaterialButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                            MaterialButton(
                              textColor: Colors.red,
                              onPressed: () {
                                controller.deleteProduct(controller.items[index]);
                                Navigator.pop(context);
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                  ),
              icon: Icon(Icons.delete, color: Colors.red.shade400),
            ),
          );
        },
        separatorBuilder: (_, _) => const Divider(),
        itemCount: controller.items.length,
        controller: controller.scrollController,
      );
    }));
  }
}
