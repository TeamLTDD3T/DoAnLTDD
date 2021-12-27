import 'package:flutter/material.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ForgotPasswordScreenScreens extends StatefulWidget {
  const ForgotPasswordScreenScreens({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenScreensState createState() => _ForgotPasswordScreenScreensState();
}

class _ForgotPasswordScreenScreensState extends State<ForgotPasswordScreenScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
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


