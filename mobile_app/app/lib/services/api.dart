import 'dart:convert';

import 'package:app/global.dart';
import 'package:app/models/category.dart';
import 'package:app/models/product.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Category>> getCategories() async {
    final response = await http.get("$baseServerUrl/category/getcategory");
    print(response.body);
    final parsed =
        jsonDecode(response.body)["categoryList"].cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  Future<List<Product>> getProducts({slug}) async {
    final response = await http.get(
      slug != null
          ? "$baseServerUrl/products/$slug"
          : "$baseServerUrl/product/getProducts",
    );
    print(response.body);
    final parsed = slug != null
        ? jsonDecode(response.body)['products'].cast<Map<String, dynamic>>()
        : jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<Product> getSingleProduct({productId}) async {
    final response = await http.get("$baseServerUrl/product/$productId");
    return Product.fromJson(jsonDecode(response.body));
  }
}
