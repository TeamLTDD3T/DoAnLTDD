import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/account_detail/components/body.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
     child: Scaffold(
       appBar: AppBar(
         title: Text(
           'Detail Account',
           style: TextStyle(
             color: Colors.white,
           ),
         ),
         backgroundColor: Colors.black,
       ),
      body: Body(),
     ),
    );
  }
}



