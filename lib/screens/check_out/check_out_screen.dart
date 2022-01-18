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
  final idTaiKhoan;
  const CheckOutScreens(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _CheckOutScreensState createState() => _CheckOutScreensState();
}

class _CheckOutScreensState extends State<CheckOutScreens> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Check out',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Body(widget.idTaiKhoan),
      ),
    );
  }
}
