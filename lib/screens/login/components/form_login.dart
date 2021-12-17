import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
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
              onPressed: () {},
              icon: Icon(Icons.facebook, size: 30),
              label: const Text(
                "Continue with Facebook",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 350,
            child: ElevatedButton.icon(
              onPressed: () {},
              // suffixIcon: SvgPicture.asset("assets/icons/google.svg"),
              icon: Icon(Icons.g_translate, color: Colors.black, size: 30),
              label: const Text(
                "Continue with Google",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
              child: const Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
          ),
          const SizedBox(height: 20),
          Container(
              child:const Text(
                'Contiue with your email',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.grey),
                hintText: 'Email Address',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isHidden,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _togglePassword,
                  child: Icon(icon),
                ),
                icon: Icon(Icons.lock, color: Colors.grey),
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
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
        ],
      ),
    );
  }
  void _togglePassword () {
    // if (isHidden == true) {
    //   isHidden = false;
    // }
    // else {
    //   isHidden = true;
    // }
    setState (() {
      isHidden =! isHidden;
      if (icon == Icons.visibility_off) {
        icon = Icons.visibility;
      }
      else
        icon = Icons.visibility_off;
    });
  }
}



