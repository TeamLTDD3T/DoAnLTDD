class OrderDetail {
  int? id;
  String? tenSize;
  int? mauId;
  int? chiTietSanPhamId;
  String? tenSanPham;
  int? gia;
  int? soLuong;
  String? tenThuongHieu;

  OrderDetail(
      {this.id,
      this.tenSize,
      this.mauId,
      this.chiTietSanPhamId,
      this.tenSanPham,
      this.gia,
      this.soLuong,
      this.tenThuongHieu});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenSize = json['ten_size'];
    mauId = json['mau_id'];
    chiTietSanPhamId = json['chi_tiet_san_pham_id'];
    tenSanPham = json['ten_san_pham'];
    gia = json['gia'];
    soLuong = json['so_luong'];
    tenThuongHieu = json['ten_thuong_hieu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_size'] = this.tenSize;
    data['mau_id'] = this.mauId;
    data['chi_tiet_san_pham_id'] = this.chiTietSanPhamId;
    data['ten_san_pham'] = this.tenSanPham;
    data['gia'] = this.gia;
    data['so_luong'] = this.soLuong;
    data['ten_thuong_hieu'] = this.tenThuongHieu;
    return data;
  }
}
