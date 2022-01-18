class Order {
  int? id;
  String? tenNguoiNhan;
  String? diaChiNguoiNhan;
  String? sdtNguoiNhan;
  String? ghiChu;
  int? trangThai;
  int? taiKhoanId;
  int? taiKhoanNhanVienId;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
      this.tenNguoiNhan,
      this.diaChiNguoiNhan,
      this.sdtNguoiNhan,
      this.ghiChu,
      this.trangThai,
      this.taiKhoanId,
      this.taiKhoanNhanVienId,
      this.createdAt,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenNguoiNhan = json['ten_nguoi_nhan'];
    diaChiNguoiNhan = json['dia_chi_nguoi_nhan'];
    sdtNguoiNhan = json['sdt_nguoi_nhan'];
    ghiChu = json['ghi_chu'];
    trangThai = json['trang_thai'];
    taiKhoanId = json['tai_khoan_id'];
    taiKhoanNhanVienId = json['tai_khoan_nhan_vien_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_nguoi_nhan'] = this.tenNguoiNhan;
    data['dia_chi_nguoi_nhan'] = this.diaChiNguoiNhan;
    data['sdt_nguoi_nhan'] = this.sdtNguoiNhan;
    data['ghi_chu'] = this.ghiChu;
    data['trang_thai'] = this.trangThai;
    data['tai_khoan_id'] = this.taiKhoanId;
    data['tai_khoan_nhan_vien_id'] = this.taiKhoanNhanVienId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
