import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
enum Gender { male, female }
class AccountInformation extends StatefulWidget {
  const AccountInformation ({Key? key}) : super(key: key);

  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Column(
        children: <Widget> [
          Text(
            'Account information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.emailAddress,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'ABC@gmail.com',
              fillColor: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Full name',
              fillColor: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              hintText: 'Brithday',
              fillColor: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Phone',
              fillColor: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              hintText: 'Address',
              fillColor: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Align (
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              style: TextStyle (
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: const Text('Male'),
            leading: Radio<Gender> (
              value: Gender.male,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio<Gender> (
              value: Gender.female,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Save",
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




