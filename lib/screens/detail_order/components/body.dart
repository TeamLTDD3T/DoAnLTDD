import 'package:flutter/material.dart';

import 'form_detail_order.dart';

class Body extends StatelessWidget {
  final idTaiKhoan;
  final idDonHang;
  final trangThaiDonHang;
  const Body(this.trangThaiDonHang, this.idTaiKhoan, this.idDonHang, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormDetailOrder(trangThaiDonHang, idTaiKhoan, idDonHang),
        ],
      ),
    );
  }
}
