import 'dart:convert';
import 'package:three_t_fashion/models/productdetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServicesCTSanPham {
  static Future<List<ProductDetail>> fetchProductDetail(int idctsp) async {
    List<ProductDetail> list = [];
    try {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2:8001/api/san-pham/chitietsanpham/$idctsp'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => ProductDetail.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product detail');
      }
    } catch (Exception) {}
    return list;
  }
}
