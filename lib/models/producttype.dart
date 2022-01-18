class ProductType {
  int? id;
  String? tenLoaiSanPham;
  String? hinhAnhLoaiSp;

  ProductType({this.id, this.tenLoaiSanPham, this.hinhAnhLoaiSp});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenLoaiSanPham = json['ten_loai_san_pham'];
    hinhAnhLoaiSp = json['hinh_anh_loai_sp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_loai_san_pham'] = this.tenLoaiSanPham;
    data['hinh_anh_loai_sp'] = this.hinhAnhLoaiSp;
    return data;
  }
}
