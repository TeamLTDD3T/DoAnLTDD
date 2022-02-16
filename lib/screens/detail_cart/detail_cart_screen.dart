import 'package:flutter/material.dart';

import 'components/body_detail_cart.dart';

class DetailCartScreen extends StatelessWidget {
  const DetailCartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class DetailCartScreens extends StatefulWidget {
  final idTaiKhoan;
  const DetailCartScreens(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _DetailCartScreensState createState() => _DetailCartScreensState();
}

class _DetailCartScreensState extends State<DetailCartScreens> {
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
            'Cart Detail',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: CartDetailBody(widget.idTaiKhoan),
      ),
    );
  }
}
