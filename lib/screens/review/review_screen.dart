import 'package:flutter/material.dart';
import 'components/body.dart';

class ReviewScreen extends StatelessWidget {
  final idTaiKhoan;
  const ReviewScreen(
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
        ),
      ),
    );
  }
}
