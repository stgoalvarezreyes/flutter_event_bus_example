import 'package:example_event_bus/controller/cart_button_controller.dart';
import 'package:example_event_bus/service/event_bus_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late CartButtonController controller;

  setUp(() {
    Get.testMode = true;
    Get.put<EventBusService>(EventBusService());
    controller = CartButtonController();
    controller.onInit();
  });

  tearDown(() {
    Get.reset();
  });

  test('initial cart should be empty', () {
    expect(controller.count.value, 0);
  });

  /* test('should add product via event bus and react to it', () async {
    final product = ProductAddedToCart('xyz', 'Mouse', 1);
    Get.find<EventBusService>().emit(product);

    await Future.delayed(Duration.zero); // Allow stream to propagate

    expect(controller.items.length, 1);
    expect(controller.items.first.productName, 'Mouse');
  }); */

  /* test('addProduct should emit event and add to items', () async {
    controller.addProduct();

    await Future.delayed(Duration.zero);

    expect(controller.items.length, 1);
    expect(controller.items.first.productId, isNotEmpty);
    expect(controller.items.first.productName, isNotEmpty);
  }); */

  /* test('addProduct should not throw even if eventBus fails', () {
    final badController = CartController();

    // Simula sin eventBus
    Get.reset();
    expect(() => badController.addProduct(), returnsNormally);
  }); */
}
