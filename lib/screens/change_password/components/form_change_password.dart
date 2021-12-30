import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormChangePassword extends StatefulWidget {
  @override
  _FormChangePasswordState createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword> {
  bool isHidden1 = true;
  bool isHidden2 = true;
  bool isHidden3 = true;
  var icon1 = Icons.visibility_off;
  var icon2 = Icons.visibility_off;
  var icon3 = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85,
      width: size.width,
      child: Column(
        children: [
          // Container(
          //     child:const Text(
          //       'Change Password',
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 30,
          //       ),
          //     )
          // ),
          // const SizedBox(height: 20),
          // Container(
          //   height: 1,
          //   width: 400,
          //   color: Colors.grey[300],
          //   alignment: Alignment.center,
          // ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isHidden1,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _togglePassword1,
                  child: Icon(icon1),
                ),
                icon: Icon(Icons.lock, color: Colors.grey),
                hintText: 'Old Password',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey[300],
            alignment: Alignment.center,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isHidden2,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _togglePassword2,
                  child: Icon(icon2),
                ),
                icon: Icon(Icons.lock, color: Colors.grey),
                hintText: 'New Password',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey[300],
            alignment: Alignment.center,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isHidden3,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _togglePassword3,
                  child: Icon(icon3),
                ),
                icon: Icon(Icons.lock, color: Colors.grey),
                hintText: 'Confirm Password',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey[300],
            alignment: Alignment.center,
          ),
          const SizedBox(height: 50),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreens(),
                //   ),
                // );
              },
              child: const Text(
                "Change",
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
  void _togglePassword1 () {
    setState (() {
      isHidden1 =! isHidden1;
      if (icon1 == Icons.visibility_off) {
        icon1 = Icons.visibility;
      }
      else
        icon1 = Icons.visibility_off;
    });
  }

  void _togglePassword2 () {
    setState (() {
      isHidden2 =! isHidden2;
      if (icon2 == Icons.visibility_off) {
        icon2 = Icons.visibility;
      }
      else
        icon2 = Icons.visibility_off;
    });
  }

  void _togglePassword3 () {
    setState (() {
      isHidden3 =! isHidden3;
      if (icon3 == Icons.visibility_off) {
        icon3 = Icons.visibility;
      }
      else
        icon3 = Icons.visibility_off;
    });
  }
}



