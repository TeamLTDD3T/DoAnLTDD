class Product {
  int? id;
  String? tenSanPham;
  String? moTa;
  int? gia;
  int? loaiSanPhamId;
  int? thuongHieuId;
  String? tenThuongHieu;
  String? hinhAnh;

  Product(
      {id,
      tenSanPham,
      moTa,
      gia,
      loaiSanPhamId,
      thuongHieuId,
      tenThuongHieu,
      hinhAnh});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenSanPham = json['ten_san_pham'];
    moTa = json['mo_ta'];
    gia = json['gia'];
    loaiSanPhamId = json['loai_san_pham_id'];
    thuongHieuId = json['thuong_hieu_id'];
    tenThuongHieu = json['ten_thuong_hieu'];
    hinhAnh = json['hinh_anh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['ten_san_pham'] = tenSanPham;
    data['mo_ta'] = moTa;
    data['gia'] = gia;
    data['loai_san_pham_id'] = loaiSanPhamId;
    data['thuong_hieu_id'] = thuongHieuId;
    data['ten_thuong_hieu'] = tenThuongHieu;
    data['hinh_anh'] = hinhAnh;
    return data;
  }
}
