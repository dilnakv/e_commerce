import 'package:e_commerce/colors/color.dart';
import 'package:e_commerce/component/product_toolbar.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/cart_item.dart';
import 'package:e_commerce/provider/cart_notifier.dart';
import 'package:e_commerce/provider/quantity_provider.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  void initState() {
    super.initState();

    // Delay the provider modification until after build
    Future.microtask(() {
      final cart = ref.read(cartProvider);
      final existingItem = cart.firstWhere(
        (item) => item.product.id == widget.product.id,
        orElse: () => CartItem(product: widget.product, quantity: 1),
      );

      ref.read(quantityProvider.notifier).state = existingItem.quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final quantity = ref.watch(quantityProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductToolbar(),
                      Image.network(
                        widget.product.image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: AppColors.lightBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$${widget.product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 13,
                                          color: AppColors.white,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          widget.product.rate.toString(),
                                          style: const TextStyle(
                                            color: AppColors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '(${widget.product.count} Reviews)',
                                    style: const TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 100,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.primary,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Description',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.product.description,
                                style: const TextStyle(color: AppColors.grey),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.black,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.grey,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (quantity > 1) {
                                                  ref
                                                      .read(
                                                        quantityProvider
                                                            .notifier,
                                                      )
                                                      .state--;
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove_outlined,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            Text(
                                              quantity.toString(),
                                              style: const TextStyle(
                                                color: AppColors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                ref
                                                    .read(
                                                      quantityProvider.notifier,
                                                    )
                                                    .state++;
                                              },
                                              icon: const Icon(
                                                Icons.add_outlined,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity > 0) {
                                            ref
                                                .read(cartProvider.notifier)
                                                .addToCart(
                                                  CartItem(
                                                    product: widget.product,
                                                    quantity: quantity,
                                                  ),
                                                );
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text('Added to cart'),
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CartScreen(
                                                      showBack: true,
                                                    ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              60,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: const Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
