import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task1/models/productModel.dart';

class Productservice {
  static const url = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Server error: ${response.statusCode}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final list = data['products'] as List;
    print(list.isEmpty);
    print(list.length);
    return list.map((e) => Product.fromJson(e)).toList();
  }
}
