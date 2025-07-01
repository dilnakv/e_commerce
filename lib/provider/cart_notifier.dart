import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_item.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
class CartNotifier extends StateNotifier<List<CartItem>> {
  static const _storageKey = 'cart_items';

  CartNotifier() : super([]) {
    _loadCart();
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      state = decoded.map((e) => CartItem.fromJson(e)).toList();
    }
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(state.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, jsonString);
  }

  void addToCart(CartItem item) {
    final index = state.indexWhere((e) => e.product.id == item.product.id);
    if (index != -1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            CartItem(
              product: state[i].product,
              quantity: state[i].quantity + item.quantity,
            )
          else
            state[i],
      ];
    } else {
      state = [...state, item];
    }
    _saveCart();
  }

  void increment(CartItem item) {
    state = [
      for (final cartItem in state)
        if (cartItem.product.id == item.product.id)
          CartItem(product: cartItem.product, quantity: cartItem.quantity + 1)
        else
          cartItem,
    ];
    _saveCart();
  }

  void decrement(CartItem item) {
    state = [
      for (final cartItem in state)
        if (cartItem.product.id == item.product.id && cartItem.quantity > 1)
          CartItem(product: cartItem.product, quantity: cartItem.quantity - 1)
        else
          cartItem,
    ];
    _saveCart();
  }

  void remove(CartItem item) {
    state = state.where((e) => e.product.id != item.product.id).toList();
    _saveCart();
  }
}

