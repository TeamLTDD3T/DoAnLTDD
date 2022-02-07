import 'package:flutter/material.dart';

import 'form_reviewed.dart';

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
    required this.star,
    required this.review,
  }) : super(key: key);

  final String name, brand, size, review;
  final int? price, id, ctspid, star;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormReviewed(
            idTaiKhoan,
            id: id,
            name: name,
            brand: brand,
            price: price,
            ctspid: ctspid,
            size: size,
            star: star,
            review: review,
          ),
        ],
      ),
    );
  }
}
