import 'package:flutter/material.dart';

import 'form_check_out.dart';

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
