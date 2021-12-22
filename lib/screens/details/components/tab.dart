import 'package:flutter/material.dart';

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
              height: 640,
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
              ),
              child: TabBarView(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        'Display Tab 1',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Display Tab 2',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Display Tab 3',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ]),
    );
  }
}