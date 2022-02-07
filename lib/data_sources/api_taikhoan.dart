import 'dart:convert';
import 'package:three_t_fashion/models/account.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:three_t_fashion/models/facebook.dart';

class ApiServicesTaiKhoan {
  Future<Account> dangNhap(String email, String matKhau) async {
    Account account = Account.rong();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/dang-nhap'),
        body: {'email': '$email', 'matKhau': '$matKhau'});
    if (response.statusCode == 200) {
      account = Account.fromJson(jsonDecode(response.body));
    }
    return account;
  }

  Future<int> dangKy(String email, String hoTen, String matKhau) async {
    var flag = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/dang-ky'),
        body: {'email': '$email', 'hoTen': '$hoTen', 'matKhau': '$matKhau'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }

  Future<int> layLaiMatKhau(String email) async {
    var flag = 0;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/lay-lai-mat-khau'),
        body: {'email': '$email'});
    if (response.statusCode == 200) {
      flag = 1;
    }
    return flag;
  }

  Future<Account> layThongTinTaiKhoan(int idTaiKhoan) async {
    Account account = Account.rong();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/lay-thong-tin-tai-khoan'),
        body: {'id': '$idTaiKhoan'});
    if (response.statusCode == 200) {
      account = Account.fromJson(jsonDecode(response.body));
    }
    return account;
  }

  Future<Account> doiMatKhau(
      String email, String matKhau, String matKhauMoi) async {
    Account account = Account.rong();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/doi-mat-khau'),
        body: {
          'email': '$email',
          'matKhau': '$matKhau',
          'matKhauMoi': '$matKhauMoi'
        });
    if (response.statusCode == 200) {
      account = Account.fromJson(jsonDecode(response.body));
    }
    return account;
  }

  Future<Account> capNhatTaiKhoan(String email, String hoTen, String ngaySinh,
      String diaChi, String sdt) async {
    Account account = Account.rong();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/cap-nhat-tai-khoan'),
        body: {
          'email': '$email',
          'hoTen': '$hoTen',
          'sdt': '$sdt',
          'ngaySinh': '$ngaySinh',
          'diaChi': '$diaChi'
        });
    if (response.statusCode == 200) {
      account = Account.fromJson(jsonDecode(response.body));
    }
    return account;
  }

  Future<Account> dangNhapBangSocial(
      String email, String name, int loai) async {
    Account account = Account.rong();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8001/api/tai-khoan/dang-nhap-bang-social'),
        body: {'email': '$email', 'name': '$name', 'loai': '$loai'});
    if (response.statusCode == 200) {
      account = Account.fromJson(jsonDecode(response.body));
    }
    return account;
  }

  Future<Facebook> chuyenDoiJsonFacebook(Map<String, dynamic> map) async {
    return Facebook.fromJson(map);
  }
}
