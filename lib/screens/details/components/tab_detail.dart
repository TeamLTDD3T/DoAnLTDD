import 'package:flutter/material.dart';

class TabDetail extends StatelessWidget {
  const TabDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Text(
        'Conscious. Short-sleeved shirt in woven viscose fabric with a printed pattern. Resort collar, buttons without placket, and straight-cut hem. Relaxed Fit – a straight-cut fit with good room for movement for a comfortable, relaxed silhouette.',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 20,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
