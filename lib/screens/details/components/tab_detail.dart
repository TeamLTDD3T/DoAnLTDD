import 'package:flutter/material.dart';

class TabDetail extends StatelessWidget {
  final String mota;
  const TabDetail(this.mota, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Text(
        this.mota,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 20,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
