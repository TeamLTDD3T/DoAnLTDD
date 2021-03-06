import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/login/login_screen.dart';
import 'package:three_t_fashion/screens/register/function/check_information.dart';

class FormRegister extends StatefulWidget {
  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> with InputValidationMixin {
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();

  final txtEmail = TextEditingController();
  final txtHoTen = TextEditingController();
  final txtMatKhau = TextEditingController();
  final txtXacNhanMatKhau = TextEditingController();
  bool isHidden1 = true;
  bool isHidden2 = true;
  var icon1 = Icons.visibility_off;
  var icon2 = Icons.visibility_off;
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
            'Create Account',
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
                      if (isEmailValid(value!))
                        return null;
                      else
                        return 'Enter a valid email address';
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: txtHoTen,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 16.0,
                        backgroundColor: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Full Name',
                      border: InputBorder.none,
                    ),
                    validator: (txthoTen) {
                      if (txtHoTen.text.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please give us your name';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: txtMatKhau,
                    textInputAction: TextInputAction.next,
                    obscureText: isHidden1,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontSize: 16.0,
                        backgroundColor: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: InkWell(
                        onTap: _togglePassword,
                        child: Icon(icon1, color: Colors.grey),
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
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: txtXacNhanMatKhau,
                    textInputAction: TextInputAction.done,
                    obscureText: isHidden2,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontSize: 16.0,
                        backgroundColor: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: InkWell(
                        onTap: _toggleConfirm,
                        child: Icon(icon2, color: Colors.grey),
                      ),
                      // icon: Icon(Icons.lock, color: Colors.grey),
                      hintText: 'Confirm Password',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (isConfirmPasswordValid(
                          txtMatKhau.text, txtXacNhanMatKhau.text)) {
                        return null;
                      }
                      return "Confirm password doesn't match password !";
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_frmKey.currentState!.validate()) {
                        _frmKey.currentState!.save();
                        // use the email provided here

                        var flag = await ApiServicesTaiKhoan().dangKy(
                            txtEmail.text, txtHoTen.text, txtMatKhau.text);
                        if (flag == 1) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Notification'),
                              content: const Text('Register Success'),
                              actions: [
                                TextButton(
                                  //onPressed: () => Navigator.pop(context, 'OK'),
                                  onPressed: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreens(),
                                    ),
                                    (route) => false,
                                  ),
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
                              content: const Text('Register Fail'),
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
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      isHidden1 = !isHidden1;
      if (icon1 == Icons.visibility_off) {
        icon1 = Icons.visibility;
      } else {
        icon1 = Icons.visibility_off;
      }
    });
  }

  void _toggleConfirm() {
    setState(() {
      isHidden2 = !isHidden2;
      if (icon2 == Icons.visibility_off) {
        icon2 = Icons.visibility;
      } else {
        icon2 = Icons.visibility_off;
      }
    });
  }
}
