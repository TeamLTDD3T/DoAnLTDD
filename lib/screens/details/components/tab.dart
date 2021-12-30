import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/details/components/tab_detail.dart';
import 'package:three_t_fashion/screens/details/components/tab_review.dart';
import 'package:three_t_fashion/screens/details/components/tab_size.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                tabs: [
                  Tab(child: Text('Detail', style: TextStyle(color: Colors.black, fontSize: 20))),
                  Tab(child: Text('Size', style: TextStyle(color: Colors.black, fontSize: 20))),
                  Tab(child: Text('Review', style: TextStyle(color: Colors.black, fontSize: 20))),
                ],
              ),
            ),
            Container(
              height: 600,
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
              ),
              child: TabBarView(
                children: <Widget>[
                  TabDetail(),
                  TabSize(),
                  TabReview(),
                ],
              ),
            ),
        ]),
    );
  }
}