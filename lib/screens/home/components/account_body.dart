import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'header.dart';
import 'list_items_account.dart';

class AccountBody extends StatelessWidget {
  final int idTaiKhoan;
  final int idLoaiTaiKhoan;
  const AccountBody(this.idTaiKhoan, this.idLoaiTaiKhoan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Header(size: size, text: 'My Account'),
        ListItemsAccount(idTaiKhoan, idLoaiTaiKhoan),
        const SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
