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
  final payment = ['COD'];
  String? value1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child:const Text(
                'Payment Information Confirmation',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
          ),
          const SizedBox(height: 40),
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
                hintText: 'FullName',
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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                icon: Icon(Icons.phone, color: Colors.grey),
                hintText: 'Phone',
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
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.home, color: Colors.grey),
                hintText: 'Address',
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.mail, color: Colors.grey),
                hintText: 'Email',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Payment Method:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value1,
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                // isExpanded: true,
                items: payment.map(buildMenuItem).toList(),
                onChanged: (value1) => setState(() => this.value1 = value1),
              ),
            ),
          ),

          const SizedBox(height: 50),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginScreens(),
                //   ),
                // );
              },
              child: const Text(
                "Payment",
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}



