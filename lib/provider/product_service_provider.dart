import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return await ProductService.fetchProducts();
});