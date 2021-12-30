import 'package:flutter/material.dart';

import 'components/list_cancel.dart';
import 'components/list_delivered.dart';
import 'components/list_delivering.dart';
import 'components/list_processed.dart';
import 'components/list_processing.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Order (5 status)',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text (
                  'Processing',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text (
                  'Processed',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text (
                  'Delivering',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text (
                  'Delivered',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text (
                  'Cancel',
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
            ListProcessing(),
            ListProcessed(),
            ListDelivering(),
            ListDelivered(),
            ListCancel(),
          ],
        ),
      ),
    );
  }
}



