import 'package:flutter/material.dart';
import 'components/body.dart';

class WishlistScreen extends StatelessWidget {
  final idTaiKhoan;
  const WishlistScreen(this.idTaiKhoan, {Key? key}) : super(key: key);
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
            'Wishlist',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Body(idTaiKhoan),
      ),
    );
  }
}
