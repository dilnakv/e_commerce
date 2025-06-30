import 'package:e_commerce/model/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity,
  };

  static CartItem fromJson(Map<String, dynamic> json) => CartItem(
    product: Product.fromJson(json['product']),
    quantity: json['quantity'],
  );
}
