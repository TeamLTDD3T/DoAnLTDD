import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/cartdetail.dart';

class ApiServicesThanhToan {
  Future<List> thanhToan(int idTaiKhoan, String tenNguoiNhan,
      String diaChiNguoiNhan, String sdtNguoiNhan, String ghiChu) async {
    List list = [];
    final response = await http
        .post(Uri.parse('http://10.0.2.2:8001/api/gio-hang/thanh-toan'), body: {
      'taiKhoanId': '$idTaiKhoan',
      'tenNguoiNhan': tenNguoiNhan,
      'diaChiNguoiNhan': diaChiNguoiNhan,
      'sdtNguoiNhan': sdtNguoiNhan,
      'ghiChu': ghiChu
    });
    final responseJson = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      list = responseJson;
    }
    return list;
  }
}
