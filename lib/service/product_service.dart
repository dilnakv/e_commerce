import 'dart:convert';
import 'package:e_commerce/model/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
// print(response.statusCode);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}