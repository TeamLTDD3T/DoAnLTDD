import 'package:flutter/material.dart';
import 'components/body.dart';

class DetailOrderScreen extends StatelessWidget {
  final idTaiKhoan;
  final idDonHang;
  final trangThaiDonHang;
  const DetailOrderScreen(
      this.trangThaiDonHang, this.idTaiKhoan, this.idDonHang,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail Order',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Body(trangThaiDonHang, idTaiKhoan, idDonHang),
      ),
    );
  }
}
