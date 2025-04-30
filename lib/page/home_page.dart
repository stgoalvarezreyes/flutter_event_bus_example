import 'package:example_event_bus/model/clear_cart.dart';
import 'package:example_event_bus/model/product_added_to_cart.dart';
import 'package:example_event_bus/service/event_bus_service.dart';
import 'package:example_event_bus/util/product_utils.dart';
import 'package:example_event_bus/widgets/cart_button.dart';
import 'package:example_event_bus/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final eventBus = Get.put(EventBusService());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text(title, style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w500)),
        actions: [CartButtonWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(child: ProductListWidget()),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 48,
                    color: Colors.blue.shade500,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    textColor: Colors.white,
                    onPressed:
                        () => eventBus.emit(ProductAddedToCart(generateRandomProductId(), getRandomProductName(), 1)),
                    child: const Text('Add Random Product'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.orange.shade600,
                    height: 48,
                    elevation: 0,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    onPressed: () => eventBus.emit(ClearCart()),
                    child: const Text('Clear Cart'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
