import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'header_with_searchbox.dart';
import 'list_items.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          ListItems(),
          //const SizedBox(height: kDefaultPadding),
        ],
    );
  }
}
