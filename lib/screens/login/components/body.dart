import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three_t_fashion/constants.dart';
import 'package:three_t_fashion/screens/login/components/form_login.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size),
          FormLogin(),
        ],
      ),
    );
  }
}
