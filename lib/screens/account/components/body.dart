import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';

import 'account_information.dart';
import 'header.dart';

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
          Header(size: size),
          AccountInformation(),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
