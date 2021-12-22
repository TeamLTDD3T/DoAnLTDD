import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'account_information.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AccountInformation(),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
