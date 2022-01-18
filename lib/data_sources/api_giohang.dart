import 'dart:convert';
import 'package:three_t_fashion/models/account.dart';
import 'package:three_t_fashion/models/picture.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/cartdetail.dart';

class ApiServices {
  Future<int> themSanPhamVaoGio(int id, int chiTietSanPham) async {
    int flag = 0;
    final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8001/api/gio-hang/them-san-pham/$chiTietSanPham'),
        body: {'id': '$id'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }

  static Future<List<CartDetail>> LayGioHang(int idtaikhoan) async {
    List<CartDetail> list = [];
    try {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2:8001/api/gio-hang/lay-gio-hang/$idtaikhoan'));
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => CartDetail.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load cart detail');
      }
    } catch (Exception) {}
    return list;
  }

  static Future<int> capNhatSoLuong(int soLuong, int? chiTietDonHang) async {
    int flag = 0;
    final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8001/api/gio-hang/update-so-luong-ctdh/$chiTietDonHang'),
        body: {'soLuong': '$soLuong'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }

  static Future<int> capNhatSize(
      int sizeid, int mauid, int? chiTietDonHang) async {
    int flag = 0;
    final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8001/api/gio-hang/update-size-ctdh/$chiTietDonHang'),
        body: {'sizeid': '$sizeid', 'mauid': '$mauid'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }

  static Future<List> layAnh(int chiTietSanPham) async {
    final response = await http.get(Uri.parse(
        'http://10.0.2.2:8001/api/gio-hang/lay-hinh-anh/$chiTietSanPham'));
    final responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responseJson;
    } else {
      throw Exception('Failed to load picture');
    }
  }

  static Future xoaCTGH(int chiTietDonHang) async {
    final response = await http.get(Uri.parse(
        'http://10.0.2.2:8001/api/gio-hang/delete-ctgh/$chiTietDonHang'));
  }
}
