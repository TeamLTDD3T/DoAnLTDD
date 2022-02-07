import 'package:flutter/material.dart';

import 'list_review.dart';

class Body extends StatelessWidget {
  final ctspid;
  final int tbsao;
  const Body(this.ctspid, this.tbsao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListReview(ctspid, tbsao),
        ],
      ),
    );
  }
}
