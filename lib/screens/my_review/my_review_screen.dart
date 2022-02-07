import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';

import 'components/list_not_review.dart';
import 'components/list_reviewed.dart';

class MyReviewScreen extends StatefulWidget {
  final idTaiKhoan;
  const MyReviewScreen(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _MyReviewScreenState createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (HomeScreens(3, widget.idTaiKhoan)),
              ),
            );
          }),
          title: const Text(
            'My Review',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Not Review',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Reviewed',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            ListNotReview(widget.idTaiKhoan),
            ListReview(widget.idTaiKhoan),
          ],
        ),
      ),
    );
  }
}
