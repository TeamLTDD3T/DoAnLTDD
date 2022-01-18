import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'package:three_t_fashion/screens/home/components/header.dart';
import 'header_with_searchbox.dart';
import 'list_categories.dart';

class CategoriesBody extends StatelessWidget {
  final int idTaiKhoan;
  const CategoriesBody(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Header(size: size, text: 'Categories'),
        ListCategories(this.idTaiKhoan),
        SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
