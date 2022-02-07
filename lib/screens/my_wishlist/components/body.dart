import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/my_wishlist/components/form_wishlist.dart';

class Body extends StatelessWidget {
  final idTaiKhoan;
  const Body(this.idTaiKhoan, {Key? key}) : super(key: key);

  void init() {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormWishlist(idTaiKhoan),
        ],
      ),
    );
  }
}
