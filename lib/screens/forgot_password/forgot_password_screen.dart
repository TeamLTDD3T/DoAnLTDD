import 'package:flutter/material.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ForgotPasswordScreens extends StatefulWidget {
  const ForgotPasswordScreens({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreensState createState() => _ForgotPasswordScreensState();
}

class _ForgotPasswordScreensState extends State<ForgotPasswordScreens> {
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
