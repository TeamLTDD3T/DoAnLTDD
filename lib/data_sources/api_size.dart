import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/size.dart';

class ApiServices {
  static Future LaySize(int idctsp) async {
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8001/api/size/lay-size/$idctsp'));
      var responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        return responseJson;
      } else {
        throw Exception('Failed to load cart detail');
      }
    } catch (Exception) {}
    return [];
  }
}
