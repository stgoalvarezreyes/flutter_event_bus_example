import 'package:example_event_bus/model/app_event.dart';

class ProductAddedToCart extends AppEvent {
  final String productId;
  final String productName;
  final int quantity;

  ProductAddedToCart(this.productId, this.productName, this.quantity);

  @override
  String toString() {
    return 'ProductAddedToCart{productID: $productId, productName: $productName, quantity: $quantity}';
  }
}
