import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            press: () {},
            text: 'Women',
            image: 'assets/images/woman_clothes.png',
          ),
          Category(
            press: () {},
            text: 'Man',
            image: 'assets/images/men_clothes.png',
          ),
          Category(
            press: () {},
            text: 'Electronics',
            image: 'assets/images/electronic.png',
          ),
          Category(
            press: () {},
            text: 'Jewellery',
            image: 'assets/images/jewellery.png',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  final String image, text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {},
        child: Chip(
          label: Row(
            children: [
              Image.asset(image, height: 25),
              SizedBox(width: 5),
              Text(text),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 222, 220, 217),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      ),
    );
  }
}
