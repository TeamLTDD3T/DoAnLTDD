import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/wishlist.dart';

class ApiServicesYeuThich {
  Future<int> layTrangThai(int taiKhoanID, int chiTietSanPhamID) async {
    var status = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/yeu-thich/lay-trang-thai'),
        body: {
          'taiKhoanID': '$taiKhoanID',
          'chiTietSanPhamID': '$chiTietSanPhamID'
        });
    if (response.body == '1') {
      status = 1;
    }
    return status;
  }

  Future<int> capNhatTrangThai(int taiKhoanID, int chiTietSanPhamID) async {
    var status = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/yeu-thich/them-hoac-xoa-yeu-thich'),
        body: {
          'taiKhoanID': '$taiKhoanID',
          'chiTietSanPhamID': '$chiTietSanPhamID'
        });
    if (response.statusCode == 200) {
      status = 1;
    }
    return status;
  }

  Future<List<WishList>> layDanhSachYeuThich(int taiKhoanID) async {
    List<WishList> list = [];
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/yeu-thich/lay-danh-sach-yeu-thich'),
        body: {
          'taiKhoanID': '$taiKhoanID',
        });
    List responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      return list = responseJson.map((e) => WishList.fromJson(e)).toList();
    }
    return list;
  }

  Future<int> xoaYeuThich(int id) async {
    var status = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/yeu-thich/xoa-yeu-thich'),
        body: {
          'id': '$id',
        });
    if (response.statusCode == 200) {
      status = 1;
    }
    return status;
  }
}
