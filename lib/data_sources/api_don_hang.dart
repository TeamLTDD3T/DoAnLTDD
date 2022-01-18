import 'dart:convert';
import 'package:three_t_fashion/models/order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/cartdetail.dart';
import 'package:three_t_fashion/models/orderdetail.dart';

class ApiServicesDonHang {
  Future<List<Order>> layDonHang(int idTaiKhoan) async {
    List<Order> list = [];
    try {
      final response = await http.post(
          Uri.parse('http://10.0.2.2:8001/api/don-hang/lay-don-hang'),
          body: {'taiKhoanId': '$idTaiKhoan'});
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => Order.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load order');
      }
    } catch (Exception) {}
    return list;
  }

  Future<List<OrderDetail>> LayCTDonHang(int idDonHang) async {
    List<OrderDetail> list = [];
    try {
      final response = await http.post(
          Uri.parse('http://10.0.2.2:8001/api/don-hang/lay-ct-don-hang'),
          body: {'donHangId': '$idDonHang'});
      List responseJson = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = responseJson.map((e) => OrderDetail.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load order detail');
      }
    } catch (Exception) {}
    return list;
  }

  Future<int> huyDonHang(int idDonHang) async {
    int flag = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/don-hang/huy-don-hang'),
        body: {'donHangId': '$idDonHang'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }
}
