import 'package:flutter/material.dart';
import 'bottom_cart.dart';
import 'header.dart';
import 'list_cart.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(size: size, text: 'Cart'),
            ListCart(),
            BottomCart(),
          ],
        ),
    );
  }
}
