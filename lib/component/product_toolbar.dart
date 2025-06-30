import 'package:e_commerce/colors/color.dart';
import 'package:flutter/material.dart';

class ProductToolbar extends StatelessWidget {
  final String? title;
  final bool showBack;

  const ProductToolbar({super.key, this.title, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          if (showBack)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.chevron_left, color: AppColors.white),
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(5),
                backgroundColor: AppColors.primary,
              ),
            ),
          if (title != null) ...[
            const SizedBox(width: 16),
            Text(
              title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ],
      ),
    );
  }
}
