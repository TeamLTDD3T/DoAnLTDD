import 'package:flutter/material.dart';

import 'form_review.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormReview(),
        ],
      ),
    );
  }
}
