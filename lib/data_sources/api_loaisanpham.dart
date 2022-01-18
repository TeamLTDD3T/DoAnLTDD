import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/producttype.dart';

class ApiServicesProductType {
  static Future<List<ProductType>> fetchProductType() async {
    List<ProductType> list = [];
    try {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2:8001/api/loai-san-pham/danh-sach-loai-sp'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => ProductType.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product type');
      }
    } catch (Exception) {}
    return list;
  }
}
