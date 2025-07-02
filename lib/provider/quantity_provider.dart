import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:e_commerce/provider/cart_notifier.dart';

final quantityProvider = StateProvider.family.autoDispose<int, int>((ref, productId) {
  final cart = ref.watch(cartProvider);
  final existingItem = cart.firstWhereOrNull(
    (item) => item.product.id == productId,
  );
  return existingItem?.quantity ?? 1; // Default to 1 if product not in cart
});
