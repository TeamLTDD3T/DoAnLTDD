import 'package:flutter/material.dart';

import 'form_detail_order.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormDetailOrder(),
        ],
      ),
    );
  }
}
