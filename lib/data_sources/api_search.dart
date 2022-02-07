import 'dart:convert';
import 'package:three_t_fashion/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServicesSearch {
  Future<List<Product>> search(String query, int idLSP) async {
    List<Product> list = [];
    try {
      final response = await http.post(
          Uri.parse('http://10.0.2.2:8001/api/search'),
          body: {'query': '$query', 'idLSP': '$idLSP'});
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product detail');
      }
    } catch (Exception) {}
    return list;
  }
}
