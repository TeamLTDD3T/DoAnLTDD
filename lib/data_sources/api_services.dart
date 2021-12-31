import 'dart:convert';
import 'package:three_t_fashion/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'api_urls.dart';

class ApiServices {
  Future<Product> fetchProduct() async {
    final response = await http.get(ApiUrls().API_PRODUCT_LIST);
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }
}
