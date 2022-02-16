import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/screens/detail_cart/components/list_detail_cart.dart';

class CartDetailBody extends StatefulWidget {
  final int idTaiKhoan;
  const CartDetailBody(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _CartDetailBodyState createState() => _CartDetailBodyState();
}

class _CartDetailBodyState extends State<CartDetailBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListDetailCart(widget.idTaiKhoan,
              ApiServicesGioHang.LayGioHang(widget.idTaiKhoan)),
        ],
      ),
    );
  }
}
