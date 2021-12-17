import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';

import 'banner.dart';
import 'featured_3t_product.dart';
import 'header_with_searchbox.dart';
import 'recommend_product.dart';
import 'new_product.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
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
          HeaderWithSearchBox(size: size),
          Banners(),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendsProducts(),
          TitleWithMoreBtn(title: "Featured Products", press: () {}),
          FeaturedProducts(),
          TitleWithMoreBtn(title: "New Products", press: () {}),
          NewProducts(),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
