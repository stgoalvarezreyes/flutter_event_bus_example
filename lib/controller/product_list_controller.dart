import 'dart:async';

import 'package:example_event_bus/model/clear_cart.dart';
import 'package:example_event_bus/model/product_added_to_cart.dart';
import 'package:example_event_bus/model/product_removed_to_cart.dart';
import 'package:example_event_bus/service/event_bus_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  final items = <ProductAddedToCart>[].obs;
  final eventBus = Get.find<EventBusService>();
  final scrollController = ScrollController();

  StreamSubscription<ProductAddedToCart>? _productAddedSubscription;
  StreamSubscription<ClearCart>? _clearCartSubscription;

  @override
  void onInit() {
    super.onInit();
    _productAddedListener();
    _clearCartListener();
  }

  void deleteProduct(ProductAddedToCart product) {
    try {
      items.remove(product);
      items.refresh();
      debugPrint('Product removed from cart: ${product.productName}');
      _updateScrollController();
      eventBus.emit(ProductRemovedToCart(product.productId, product.productName));
    } catch (e) {
      debugPrint('Error removing product: $e');
    }
  }

  void _clearCartListener() {
    _clearCartSubscription?.cancel();
    _clearCartSubscription = eventBus.on<ClearCart>().listen((event) {
      try {
        items.clear();
        items.refresh();
        debugPrint('Cart cleared');
      } catch (e) {
        debugPrint('Error adding product: $e');
      }
    });
  }

  void _productAddedListener() {
    _productAddedSubscription?.cancel();
    _productAddedSubscription = eventBus.on<ProductAddedToCart>().listen((event) {
      try {
        items.add(event);
        debugPrint('Product added to cart: ${event.productName}');
        _updateScrollController();
      } catch (e) {
        debugPrint('Error adding product: $e');
      }
    });
  }

  void _updateScrollController() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void onClose() {
    _productAddedSubscription?.cancel();
    _clearCartSubscription?.cancel();
    super.onClose();
  }
}
