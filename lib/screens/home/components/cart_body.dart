import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/models/cartdetail.dart';
import 'bottom_cart.dart';
import 'header.dart';
import 'list_cart.dart';

class CartBody extends StatefulWidget {
  final idTaiKhoan;
  const CartBody(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size, text: 'Cart'),
          ListCart(widget.idTaiKhoan,
              ApiServicesGioHang.LayGioHang(widget.idTaiKhoan)),
          BottomCart(widget.idTaiKhoan,
              ApiServicesGioHang.LayGioHang(widget.idTaiKhoan)),
        ],
      ),
    );
  }
}
