import 'package:example_event_bus/model/app_event.dart';
import 'package:example_event_bus/model/clear_cart.dart';
import 'package:example_event_bus/model/product_added_to_cart.dart';
import 'package:example_event_bus/model/product_removed_to_cart.dart';
import 'package:example_event_bus/service/event_bus_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CartButtonController extends GetxController {
  final count = RxInt(0);
  final eventBus = Get.find<EventBusService>();

  @override
  void onInit() {
    super.onInit();

    eventBus.on<AppEvent>().listen((event) {
      if (event is ProductAddedToCart) {
        count.value++;
        count.refresh();
        debugPrint('Count: $count');
        return;
      }
      if (event is ProductRemovedToCart) {
        count.value--;
        count.refresh();
        debugPrint('Count: $count');
        return;
      }
      if (event is ClearCart) {
        count.value = 0;
        count.refresh();
        debugPrint('Count: $count');
        return;
      }
    });
  }
}
