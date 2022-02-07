import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/notreview.dart';
import 'package:three_t_fashion/models/review.dart';
import 'package:three_t_fashion/models/reviewed.dart';

class ApiServicesDanhGia {
  Future<List<NotReview>> layDanhSachChuaDanhGia(int taiKhoanID) async {
    List<NotReview> list = [];
    final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8001/api/danh-gia/lay-danh-sach-chua-danh-gia'),
        body: {
          'taiKhoanID': '$taiKhoanID',
        });
    List responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      return list = responseJson.map((e) => NotReview.fromJson(e)).toList();
    }
    return list;
  }

  Future<List<Reviewed>> layDanhSachDaDanhGia(int taiKhoanID) async {
    List<Reviewed> list = [];
    final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8001/api/danh-gia/lay-danh-sach-da-danh-gia'),
        body: {
          'taiKhoanID': '$taiKhoanID',
        });
    List responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      return list = responseJson.map((e) => Reviewed.fromJson(e)).toList();
    }
    return list;
  }

  Future<List<Review>> layDanhGiaTheoSanPham(int ctspID) async {
    List<Review> list = [];
    final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8001/api/danh-gia/lay-danh-gia-theo-san-pham'),
        body: {
          'ctspID': '$ctspID',
        });
    List responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      return list = responseJson.map((e) => Review.fromJson(e)).toList();
    }
    return list;
  }

  Future<int> trungBinhSao(int ctspID) async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/danh-gia/trung-binh-sao'),
        body: {
          'ctspID': '$ctspID',
        });
    int responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responseJson;
    }
    return 0;
  }

  Future<int> themDanhGia(int taiKhoanID, int ctdhID, int ctspID, double soSao,
      String noiDung) async {
    var status = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/danh-gia/them-danh-gia'),
        body: {
          'taiKhoanID': '$taiKhoanID',
          'ctdhID': '$ctdhID',
          'ctspID': '$ctspID',
          'soSao': '$soSao',
          'noiDung': '$noiDung',
        });
    if (response.statusCode == 200) {
      status = 1;
    }
    return status;
  }
}
