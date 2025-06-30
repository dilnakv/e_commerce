import 'package:e_commerce/colors/color.dart';
import 'package:e_commerce/component/cart_tile.dart';
import 'package:e_commerce/component/checkout_box.dart';
import 'package:e_commerce/component/product_toolbar.dart';
import 'package:e_commerce/provider/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  final bool showBack;

  const CartScreen({super.key, this.showBack = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      bottomSheet: cartItems.isNotEmpty ? CheckOutBox(items: cartItems) : null,
      body: SafeArea(
        child: Column(
          children: [
            ProductToolbar(title: "My Cart", showBack: showBack),
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(child: Text("Your cart is empty"))
                  : ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartTile(
                          item: item,
                          onAdd: () {
                            ref.read(cartProvider.notifier).increment(item);
                          },
                          onRemove: () {
                            if (item.quantity > 1) {
                              ref.read(cartProvider.notifier).decrement(item);
                            } else {
                              ref.read(cartProvider.notifier).remove(item);
                            }
                          },
                          onDelete: () {
                            ref.read(cartProvider.notifier).remove(item);
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
