import 'package:flutter/material.dart';

import 'list_review.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListReview(),
        ],
      ),
    );
  }
}
