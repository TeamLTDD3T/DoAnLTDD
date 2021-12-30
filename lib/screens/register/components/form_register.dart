import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/login/login_screen.dart';

class FormRegister extends StatefulWidget {
  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
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
            width: 350,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/facebook.svg", height: 30, color: Colors.white),
              label: const Text(
                "Continue with Facebook",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 57 , 70, 151)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 350,
            child: ElevatedButton.icon(
              onPressed: () {},
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
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
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
            child: const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.grey),
                hintText: 'Full Name',
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
              obscureText: isHidden1,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _togglePassword,
                  child: Icon(icon1, color: Colors.grey),
                ),
                icon: Icon(Icons.lock, color: Colors.grey),
                hintText: 'Password',
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
              obscureText: isHidden2,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _toggleConfirm,
                  child: Icon(icon2, color: Colors.grey),
                ),
                icon: Icon(Icons.lock, color: Colors.grey),
                hintText: 'Confirm Password',
                border: InputBorder.none,
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
                    builder: (context) => LoginScreens(),
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
    setState (() {
      isHidden1 =! isHidden1;
      if (icon1 == Icons.visibility_off) {
        icon1 = Icons.visibility;
      }
      else
        icon1 = Icons.visibility_off;
    });
  }
  void _toggleConfirm () {
    setState (() {
      isHidden2 =! isHidden2;
      if (icon2 == Icons.visibility_off) {
        icon2 = Icons.visibility;
      }
      else
        icon2 = Icons.visibility_off;
    });
  }
}



