import 'package:flutter/material.dart';
import 'components/body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class CheckOutScreens extends StatefulWidget {
  const CheckOutScreens({Key? key}) : super(key: key);

  @override
  _CheckOutScreensState createState() => _CheckOutScreensState();
}

class _CheckOutScreensState extends State<CheckOutScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Check out',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Body(),
    );
  }
}


