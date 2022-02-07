class NotReview {
  int? id;
  int? chiTietSanPhamId;
  String? tenThuongHieu;
  String? tenSanPham;
  int? gia;
  String? tenSize;
  NotReview({
    this.id,
    this.chiTietSanPhamId,
    this.tenThuongHieu,
    this.tenSanPham,
    this.gia,
    this.tenSize,
  });

  NotReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chiTietSanPhamId = json['chi_tiet_san_pham_id'];
    tenThuongHieu = json['ten_thuong_hieu'];
    tenSanPham = json['ten_san_pham'];
    gia = json['gia'];
    tenSize = json['ten_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chi_tiet_san_pham_id'] = this.chiTietSanPhamId;
    data['ten_thuong_hieu'] = this.tenThuongHieu;
    data['ten_san_pham'] = this.tenSanPham;
    data['gia'] = this.gia;
    data['ten_size'] = this.tenSize;
    return data;
  }
}
