import 'package:flutter/material.dart';

import 'form_review.dart';

class Body extends StatelessWidget {
  final idTaiKhoan;
  const Body(
    this.idTaiKhoan, {
    Key? key,
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.ctspid,
    required this.size,
  }) : super(key: key);

  final String name, brand, size;
  final int? price, id, ctspid;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormReview(
            idTaiKhoan,
            id: id,
            name: name,
            brand: brand,
            price: price,
            ctspid: ctspid,
            size: size,
          ),
        ],
      ),
    );
  }
}
