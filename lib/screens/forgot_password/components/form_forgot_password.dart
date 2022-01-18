import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/screens/login/login_screen.dart';
import 'package:three_t_fashion/screens/register/function/check_information.dart';

class FormForgotPassword extends StatefulWidget {
  @override
  _FormForgotPasswordState createState() => _FormForgotPasswordState();
}

class _FormForgotPasswordState extends State<FormForgotPassword>
    with InputValidationMixin {
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();
  final txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.modulate),
          image: AssetImage("assets/images/Background/Background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: const Text(
            ' Request new password',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            child: Form(
              key: _frmKey,
              child: TextFormField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(
                    fontSize: 16.0,
                    backgroundColor: Colors.black,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email Address',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (isEmailValid(value!)) {
                    return null;
                  }
                  return 'Enter a valid email address';
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () async {
                if (_frmKey.currentState!.validate()) {
                  _frmKey.currentState!.save();

                  var test =
                      await ApiServicesTaiKhoan().layLaiMatKhau(txtEmail.text);
                  if (test == 1) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Notification'),
                        content: const Text(
                            'Password Recovery Mail was send to your email'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Notification'),
                        content:
                            const Text('Email does not exist in 3TFashion'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: const Text(
                "Request new password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
