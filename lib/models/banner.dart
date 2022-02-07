class BannerPic {
  int? id;
  String? tenBanner;
  String? hinhAnhBanner;

  BannerPic({this.id, this.tenBanner, this.hinhAnhBanner});

  BannerPic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenBanner = json['ten_banner'];
    hinhAnhBanner = json['hinh_anh_banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_banner'] = this.tenBanner;
    data['hinh_anh_banner'] = this.hinhAnhBanner;
    return data;
  }
}
