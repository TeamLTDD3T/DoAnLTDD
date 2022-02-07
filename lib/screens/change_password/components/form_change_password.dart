import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/screens/change_password/function/check_password.dart';

class FormChangePassword extends StatefulWidget {
  final email;
  const FormChangePassword(this.email, {Key? key}) : super(key: key);
  @override
  _FormChangePasswordState createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword>
    with InputValidationMixin {
  bool isHidden1 = true;
  bool isHidden2 = true;
  bool isHidden3 = true;
  var icon1 = Icons.visibility_off;
  var icon2 = Icons.visibility_off;
  var icon3 = Icons.visibility_off;
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();
  final txtMatKhau = TextEditingController();
  final txtMatKhauMoi = TextEditingController();
  final txtMatKhauXacNhan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85,
      width: size.width,
      child: Form(
        key: _frmKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: txtMatKhau,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isHidden1,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: _togglePassword1,
                    child: Icon(icon1),
                  ),
                  icon: const Icon(Icons.lock, color: Colors.grey),
                  hintText: 'Old Password',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (isPasswordValid(value!)) {
                    return null;
                  }
                  return 'Password is invalid!';
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: txtMatKhauMoi,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isHidden2,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: _togglePassword2,
                    child: Icon(icon2),
                  ),
                  icon: const Icon(Icons.lock, color: Colors.grey),
                  hintText: 'New Password',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (isPasswordValid(value!)) {
                    return null;
                  }
                  return 'Password is invalid!';
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: txtMatKhauXacNhan,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isHidden3,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: _togglePassword3,
                    child: Icon(icon3),
                  ),
                  icon: const Icon(Icons.lock, color: Colors.grey),
                  hintText: 'Confirm Password',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (isConfirmPasswordValid(
                      txtMatKhauMoi.text, txtMatKhauXacNhan.text)) {
                    return null;
                  }
                  return "Confirm password doesn't match password !";
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              child: ElevatedButton(
                onPressed: () async {
                  if (_frmKey.currentState!.validate()) {
                    _frmKey.currentState!.save();
                    var taiKhoan = await ApiServicesTaiKhoan().doiMatKhau(
                        widget.email, txtMatKhau.text, txtMatKhauMoi.text);
                    if (taiKhoan.email != '') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Notification'),
                          content: const Text('Password change Success!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                txtMatKhau.clear();
                                txtMatKhauMoi.clear();
                                txtMatKhauXacNhan.clear();
                              },
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
                          content: const Text(
                              'Password change failed! Old password not correct!'),
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
                  "Change",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePassword1() {
    setState(() {
      isHidden1 = !isHidden1;
      if (icon1 == Icons.visibility_off) {
        icon1 = Icons.visibility;
      } else {
        icon1 = Icons.visibility_off;
      }
    });
  }

  void _togglePassword2() {
    setState(() {
      isHidden2 = !isHidden2;
      if (icon2 == Icons.visibility_off) {
        icon2 = Icons.visibility;
      } else {
        icon2 = Icons.visibility_off;
      }
    });
  }

  void _togglePassword3() {
    setState(() {
      isHidden3 = !isHidden3;
      if (icon3 == Icons.visibility_off) {
        icon3 = Icons.visibility;
      } else {
        icon3 = Icons.visibility_off;
      }
    });
  }
}
