import 'package:flutter/material.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 50),
      // It will cover 20% of our total height
      height: size.height * 0.15,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 110,
            ),
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  '3T Fashion',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
