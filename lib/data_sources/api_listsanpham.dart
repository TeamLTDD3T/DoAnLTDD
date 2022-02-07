import 'dart:convert';
import 'package:three_t_fashion/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices {
  Future<List<Product>> fetchProduct() async {
    List<Product> list = [];
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8001/api/san-pham/danh-sach'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (Exception) {}
    return list;
  }

  Future<List<Product>> fetchProductRecom() async {
    List<Product> list = [];
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8001/api/san-pham/danh-sach-recom'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (Exception) {}
    return list;
  }

  Future<List<Product>> fetchProductFea() async {
    List<Product> list = [];
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8001/api/san-pham/danh-sach-fea'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (Exception) {}
    return list;
  }

  Future<List<Product>> fetchProductNew() async {
    List<Product> list = [];
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8001/api/san-pham/danh-sach-new'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (Exception) {}
    return list;
  }

  Future<List<Product>> fetchProductByType(int idloai) async {
    List<Product> list = [];
    try {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2:8001/api/san-pham/danh-sach-theo-loai/$idloai'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (Exception) {}
    return list;
  }
}
