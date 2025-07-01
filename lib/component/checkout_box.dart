import 'package:e_commerce/colors/color.dart';
import 'package:e_commerce/model/cart_item.dart';
import 'package:e_commerce/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class CheckOutBox extends StatelessWidget {
  final List<CartItem> items;

  const CheckOutBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final double total = items.isNotEmpty
        ? items.map((e) => e.quantity * e.product.price).reduce((a, b) => a + b)
        : 0.0;

    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: total == 0.0
                ? null
                : () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    DashboardScreenState.goToTab(0);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 55),
              disabledBackgroundColor: Colors.grey.shade300,
            ),
            child: const Text(
              "Check out",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
