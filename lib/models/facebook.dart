class Facebook {
  String? email;
  String? name;
  String? id;

  Facebook({this.email, this.name, this.id});

  Facebook.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    id = json['id'];
  }

  Facebook.rong() {
    email = '';
    name = '';
    id = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
