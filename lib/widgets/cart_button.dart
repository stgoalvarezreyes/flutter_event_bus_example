import 'package:example_event_bus/controller/cart_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartButtonController());
    return Obx((() {
      return Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // controller.showCartItems();
            },
            tooltip: 'Cart (${controller.count})',
          ),
          if (controller.count > 0)
            Positioned(
              right: 4,
              top: 2,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text('${controller.count}', style: const TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ),
        ],
      );
    }));
  }
}
