class WishList {
  int? id;
  int? chiTietSanPhamId;
  String? tenSanPham;
  int? gia;
  String? tenThuongHieu;
  String? hinhAnh;
  int? trangThai;

  WishList(
      {this.id,
      this.chiTietSanPhamId,
      this.tenSanPham,
      this.gia,
      this.tenThuongHieu,
      this.hinhAnh,
      this.trangThai});

  WishList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chiTietSanPhamId = json['chi_tiet_san_pham_id'];
    tenSanPham = json['ten_san_pham'];
    gia = json['gia'];
    tenThuongHieu = json['ten_thuong_hieu'];
    hinhAnh = json['hinh_anh'];
    trangThai = json['trang_thai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chi_tiet_san_pham_id'] = this.chiTietSanPhamId;
    data['ten_san_pham'] = this.tenSanPham;
    data['gia'] = this.gia;
    data['ten_thuong_hieu'] = this.tenThuongHieu;
    data['hinh_anh'] = this.hinhAnh;
    data['trang_thai'] = this.trangThai;
    return data;
  }
}
