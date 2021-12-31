import 'dart:convert';
import 'package:three_t_fashion/models/account.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'api_urls.dart';

class ApiServices {
  Future<Account> dangNhap(String email, String matKhau) async {
    Account account = Account.rong();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/tai-khoan/dang-nhap'),
        body: {'email': '$email', 'matKhau': '$matKhau'});
    if (response.statusCode == 200) {
      account = Account.fromJson(jsonDecode(response.body));
    }
    return account;
  }

  Future<int> dangKy(String email, String hoTen, String matKhau) async {
    var flag = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/tai-khoan/dang-ky'),
        body: {'email': '$email', 'hoTen': '$hoTen', 'matKhau': '$matKhau'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }
}
