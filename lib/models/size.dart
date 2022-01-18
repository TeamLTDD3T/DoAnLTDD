class Size {
  int? id;
  String? tenSize;

  Size({this.id, this.tenSize});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenSize = json['ten_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_size'] = this.tenSize;
    return data;
  }
}
