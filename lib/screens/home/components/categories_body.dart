import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'header_with_searchbox.dart';
import 'list_categories.dart';

class CategoriesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          ListCategories(),
          SizedBox(height: kDefaultPadding),
        ],
    );
  }
}
