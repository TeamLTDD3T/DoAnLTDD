class Picture {
  int? chiTietSanPhamId;
  String? hinhAnh;

  Picture({this.chiTietSanPhamId, this.hinhAnh});

  Picture.fromJson(Map<String, dynamic> json) {
    chiTietSanPhamId = json['chi_tiet_san_pham_id'];
    hinhAnh = json['hinh_anh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chi_tiet_san_pham_id'] = this.chiTietSanPhamId;
    data['hinh_anh'] = this.hinhAnh;
    return data;
  }
}
