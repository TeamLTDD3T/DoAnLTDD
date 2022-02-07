import 'package:flutter/material.dart';
import 'components/body.dart';

class SeeAllReviewScreen extends StatelessWidget {
  final ctspid;
  final double tbsao;
  const SeeAllReviewScreen(this.ctspid, this.tbsao, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'See All Review',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Body(ctspid, tbsao),
      ),
    );
  }
}
