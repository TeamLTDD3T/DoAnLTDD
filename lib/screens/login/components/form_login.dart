import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/models/facebook.dart';
import 'package:three_t_fashion/screens/register/function/check_information.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../register/register_screen.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'dart:convert';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> with InputValidationMixin {
  Facebook _userData = Facebook.rong();
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  // Map? _userData;
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();
  final txtEmail = TextEditingController();
  final txtMatKhau = TextEditingController();
  bool isHidden = true;
  var icon = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85,
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
            width: 350,
            child: ElevatedButton.icon(
              onPressed: () async {
                final result = await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
                if (result.status == LoginStatus.success) {
                  final requestData = await FacebookAuth.i.getUserData(fields: "email, name");
                  var temp = await ApiServicesTaiKhoan().chuyenDoiJsonFacebook(requestData);
                  setState(() {
                    _userData = temp;
                  });
                  var user = await ApiServicesTaiKhoan().dangNhapBangSocial(_userData.email!, _userData.name!, 3);
                  if (user.email != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreens(0, user.id!),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Notification'),
                        content: const Text('Email already in use!'),
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
              icon: SvgPicture.asset("assets/icons/facebook.svg", height: 30, color: Colors.white),
              label: const Text(
                "Continue with Facebook",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 57, 70, 151)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 350,
            child: ElevatedButton.icon(
              onPressed: () async {
                _googleSignIn.signIn().then((userData) async {
                  setState(() {
                    _userObj = userData!;
                  });
                  var user = await ApiServicesTaiKhoan().dangNhapBangSocial(_userObj.email, _userObj.displayName!, 4);
                  if (user.email != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreens(0, user.id!),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Notification'),
                        content: const Text('Email already in use!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                });
              },
              icon: SvgPicture.asset("assets/icons/google.svg", height: 30),
              //icon: Icon(Icons.g_translate, color: Colors.black, size: 30),
              label: const Text(
                "Continue with Google",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              child: const Text(
            'OR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          const SizedBox(height: 20),
          Container(
              child: const Text(
            'Contiue with your email',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          const SizedBox(height: 20),
          Form(
            key: _frmKey,
            child: Column(
              children: [
                Container(
                  width: 350,
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
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: txtMatKhau,
                    obscureText: isHidden,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontSize: 16.0,
                        backgroundColor: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: InkWell(
                        onTap: _togglePassword,
                        child: Icon(icon),
                      ),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (isPasswordValid(value!)) {
                        return null;
                      }
                      return 'Enter a valid password';
                    },
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreens(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
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

                        var user = await ApiServicesTaiKhoan().dangNhap(txtEmail.text, txtMatKhau.text);
                        if (user.email != '') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreens(0, user.id!),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Notification'),
                              content: const Text('Email or password incorrect'),
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
                      "Login",
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
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreens(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      isHidden = !isHidden;
      if (icon == Icons.visibility_off) {
        icon = Icons.visibility;
      } else
        icon = Icons.visibility_off;
    });
  }
}
