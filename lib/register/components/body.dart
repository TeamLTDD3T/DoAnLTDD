import 'package:flutter/material.dart';
import 'form_register.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          FormRegister(),
        ],
      ),
    );
  }
}
