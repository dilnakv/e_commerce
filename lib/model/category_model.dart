import 'package:flutter/material.dart';

class CategoriesIcons {
  final String title;

  final IconData icon;

  CategoriesIcons({
    required this.icon,
    required this.title,
  });
}

List demoCategories = [
  CategoriesIcons(
    icon: Icons.search,
    title: "All",
  ),
  CategoriesIcons(
    icon: Icons.event_seat_outlined,
    title: "Men's Clothing",
  ),
  CategoriesIcons(
    icon: Icons.table_restaurant_outlined,
    title: "Women's Clothing",
  ),
  CategoriesIcons(
    icon: Icons.chair_outlined,
    title: "Electronics",
  ),
  CategoriesIcons(
    icon: Icons.light_outlined ,
    title: "Jewellery",
  ),
];