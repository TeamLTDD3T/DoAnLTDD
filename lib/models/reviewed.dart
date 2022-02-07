class Reviewed {
  int? id;
  int? soSao;
  String? noiDung;
  int? chiTietSanPhamId;
  String? tenThuongHieu;
  String? tenSanPham;
  int? gia;
  String? tenSize;

  Reviewed(
      {this.id,
      this.soSao,
      this.noiDung,
      this.chiTietSanPhamId,
      this.tenThuongHieu,
      this.tenSanPham,
      this.gia,
      this.tenSize});

  Reviewed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    soSao = json['so_sao'];
    noiDung = json['noi_dung'];
    chiTietSanPhamId = json['chi_tiet_san_pham_id'];
    tenThuongHieu = json['ten_thuong_hieu'];
    tenSanPham = json['ten_san_pham'];
    gia = json['gia'];
    tenSize = json['ten_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['so_sao'] = this.soSao;
    data['noi_dung'] = this.noiDung;
    data['chi_tiet_san_pham_id'] = this.chiTietSanPhamId;
    data['ten_thuong_hieu'] = this.tenThuongHieu;
    data['ten_san_pham'] = this.tenSanPham;
    data['gia'] = this.gia;
    data['ten_size'] = this.tenSize;
    return data;
  }
}
