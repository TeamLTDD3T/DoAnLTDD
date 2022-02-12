import 'package:flutter/material.dart';
import 'package:three_t_fashion/components/my_bottom_nav_bar.dart';
import 'package:three_t_fashion/screens/products/components/body.dart';
import 'package:three_t_fashion/screens/home/components/categories_body.dart';
import 'package:three_t_fashion/models/product.dart';

import 'body_list_product.dart';

class ListProductHomeScreen extends StatelessWidget {
  const ListProductHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ListProductsHomeScreen extends StatefulWidget {
  final int idTaiKhoan;
  final Future<List<Product>> list;
  const ListProductsHomeScreen(this.idTaiKhoan, this.list, {Key? key})
      : super(key: key);

  @override
  _ListProductsHomeScreenState createState() => _ListProductsHomeScreenState();
}

class _ListProductsHomeScreenState extends State<ListProductsHomeScreen> {
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
        body: BodyListProduct(widget.idTaiKhoan, widget.list),
      ),
    );
  }
}
