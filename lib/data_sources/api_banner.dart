import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/banner.dart';

class ApiServicesBanner {
  Future<List<BannerPic>> fetchBanner() async {
    List<BannerPic> list = [];
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8001/api/banner/danh-sach-banner'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => BannerPic.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load banner');
      }
    } catch (Exception) {}
    return list;
  }
}
