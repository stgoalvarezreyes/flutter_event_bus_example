import 'package:example_event_bus/model/product_added_to_cart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should create a valid ProductAddedToCart object', () {
    final product = ProductAddedToCart('123', 'Laptop', 2);

    expect(product.productId, '123');
    expect(product.productName, 'Laptop');
    expect(product.quantity, 2);
  });

  test('toString should return readable string', () {
    final product = ProductAddedToCart('abc', 'Monitor', 1);
    expect(product.toString(), contains('productID: abc'));
    expect(product.toString(), contains('Monitor'));
    expect(product.toString(), contains('1'));
  });
}
