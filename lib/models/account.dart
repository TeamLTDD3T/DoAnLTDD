class Account {
  int? id;
  late String email;
  String? hoten;
  String? ngaysinh;
  String? diachi;
  String? sdt;
  int? loaiTaiKhoanId;

  Account({id, required email, hoten, ngaysinh, diachi, sdt, loaiTaiKhoanId});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    hoten = json['hoten'];
    ngaysinh = json['ngaysinh'];
    diachi = json['diachi'];
    sdt = json['sdt'];
    loaiTaiKhoanId = json['loai_tai_khoan_id'];
  }

  Account.rong() {
    email = '';
    hoten = '';
    ngaysinh = '';
    diachi = '';
    sdt = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['hoten'] = hoten;
    data['ngaysinh'] = ngaysinh;
    data['diachi'] = diachi;
    data['sdt'] = sdt;
    data['loai_tai_khoan_id'] = loaiTaiKhoanId;
    return data;
  }
}
