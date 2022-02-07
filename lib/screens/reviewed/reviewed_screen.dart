import 'package:flutter/material.dart';
import 'components/body.dart';

class ReviewedScreen extends StatelessWidget {
  final idTaiKhoan;
  const ReviewedScreen(
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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Review',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Body(
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
      ),
    );
  }
}
