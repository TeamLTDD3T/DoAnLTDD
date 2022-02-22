import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'package:three_t_fashion/data_sources/api_listsanpham.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';
import 'banner.dart';
import 'featured_3t_product.dart';
import 'header_with_searchbox.dart';
import 'list_product_home_screen.dart';
import 'recommend_product.dart';
import 'new_product.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
  final int idTaiKhoan;
  const Body(this.idTaiKhoan, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(0, idTaiKhoan, size: size),
          Banners(),
          TitleWithMoreBtn(
              title: "Recomended",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListProductsHomeScreen(idTaiKhoan, ApiServices().fetchProductRecom()),
                  ),
                );
              }),
          RecomendsProducts(
            idTaiKhoan,
          ),
          TitleWithMoreBtn(
              title: "Featured Products",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListProductsHomeScreen(idTaiKhoan, ApiServices().fetchProductFea()),
                  ),
                );
              }),
          FeaturedProducts(
            idTaiKhoan,
          ),
          TitleWithMoreBtn(
              title: "New Products",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListProductsHomeScreen(this.idTaiKhoan, ApiServices().fetchProductNew()),
                  ),
                );
              }),
          NewProducts(
            this.idTaiKhoan,
          ),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
