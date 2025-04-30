import 'package:example_event_bus/model/app_event.dart';

class ProductRemovedToCart extends AppEvent {
  ProductRemovedToCart(this.productId, this.productName);
  final String productId;
  final String productName;

  @override
  String toString() {
    return 'ProductRemovedToCart{productID: $productId, productName: $productName}';
  }
}
