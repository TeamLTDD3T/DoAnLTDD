import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'package:three_t_fashion/screens/details/components/tab.dart';

import 'product_picture.dart';
import 'title_with_price.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProductPictures(),
          TitleAndPrice(brand: "Angelica", name: "Russia", price: 440),
          SizedBox(height: kDefaultPadding),
          Tabs(),
        ],
      ),
    );
  }
}
