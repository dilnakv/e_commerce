import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/colors/color.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int _currentIndex = 0;

  final List<String> sliderImages = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: sliderImages.map((path) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliderImages.asMap().entries.map((entry) {
            bool isActive = entry.key == _currentIndex;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: isActive ? 24.0 : 8.0,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
