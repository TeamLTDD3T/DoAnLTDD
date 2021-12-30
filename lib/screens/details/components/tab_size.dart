import 'package:flutter/material.dart';

class TabSize extends StatelessWidget {
  const TabSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Center(
            child: Text(
              'Size Guide',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'All conversion are approximate. Sizes may vary by manufacturer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/images/Size/Size.png'),
        ],
      ),

    );
  }
}
