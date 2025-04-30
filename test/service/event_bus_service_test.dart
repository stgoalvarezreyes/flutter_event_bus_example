import 'package:example_event_bus/model/product_added_to_cart.dart';
import 'package:example_event_bus/service/event_bus_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EventBusService eventBus;

  setUp(() {
    eventBus = EventBusService();
  });

  test('should emit and listen to ProductAddedToCart events', () async {
    final event = ProductAddedToCart('001', 'Tablet', 1);

    final emitted = <ProductAddedToCart>[];

    eventBus.on<ProductAddedToCart>().listen((e) => emitted.add(e));
    eventBus.emit(event);

    await Future.delayed(Duration.zero); // Let the stream deliver the event

    expect(emitted.length, 1);
    expect(emitted.first.productId, '001');
    expect(emitted.first.productName, 'Tablet');
  });
}
