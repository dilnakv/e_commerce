import 'package:e_commerce/colors/color.dart';
import 'package:e_commerce/model/cart_item.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final CartItem item;
  final Function() onRemove;
  final Function() onAdd;
  final Function() onDelete;

  const CartTile({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.network(
              item.product.image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  item.product.category,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  "\$${item.product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete, color: AppColors.black, size: 20),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onRemove,
                      iconSize: 18,
                      icon: const Icon(Icons.remove, color: AppColors.black),
                    ),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: onAdd,
                      iconSize: 18,
                      icon: const Icon(Icons.add, color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
