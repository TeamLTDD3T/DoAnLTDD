import 'package:flutter/material.dart';
import 'form_forgot_password.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          FormForgotPassword(),
        ],
      ),
    );
  }
}
