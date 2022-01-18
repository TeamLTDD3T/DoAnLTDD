class ProductDetail {
  int? id;
  String? tenSanPham;
  int? gia;
  String? moTa;
  String? tenThuongHieu;
  String? hinhAnh;

  ProductDetail(
      {this.id,
      this.tenSanPham,
      this.gia,
      this.moTa,
      this.tenThuongHieu,
      this.hinhAnh});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenSanPham = json['ten_san_pham'];
    gia = json['gia'];
    moTa = json['mo_ta'];
    tenThuongHieu = json['ten_thuong_hieu'];
    hinhAnh = json['hinh_anh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_san_pham'] = this.tenSanPham;
    data['gia'] = this.gia;
    data['mo_ta'] = this.moTa;
    data['ten_thuong_hieu'] = this.tenThuongHieu;
    data['hinh_anh'] = this.hinhAnh;
    return data;
  }
}
