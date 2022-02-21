import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/products/components/list_items.dart';
import 'header_home.dart';
import 'package:three_t_fashion/models/product.dart';

class BodyListProduct extends StatelessWidget {
  final int idTaiKhoan;
  final Future<List<Product>> list;
  const BodyListProduct(this.idTaiKhoan, this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderHome(
          text: 'List Product',
          size: size,
        ),
        ListItems(idTaiKhoan, list),
      ],
    );
  }
}
