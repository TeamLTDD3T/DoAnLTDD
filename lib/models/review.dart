class Review {
  String? email;
  int? soSao;
  String? noiDung;
  String? createdAt;
  String? tenSize;

  Review({this.email, this.soSao, this.noiDung, this.createdAt, this.tenSize});

  Review.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    soSao = json['so_sao'];
    noiDung = json['noi_dung'];
    createdAt = json['created_at'];
    tenSize = json['ten_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['so_sao'] = this.soSao;
    data['noi_dung'] = this.noiDung;
    data['created_at'] = this.createdAt;
    data['ten_size'] = this.tenSize;
    return data;
  }
}
