import 'package:flutter/material.dart';

import 'components/list_not_review.dart';
import 'components/list_reviewed.dart';


class MyReviewScreen extends StatefulWidget {
  const MyReviewScreen({Key? key}) : super(key: key);

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
          title: Text(
            'My Review',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text (
                  'Not Review',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text (
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
            ListNotReview(),
            ListReview(),
          ],
        ),
      ),
    );
  }
}



