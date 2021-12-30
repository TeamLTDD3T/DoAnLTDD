import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/detail_order/detail_order_screen.dart';

class ListDelivered extends StatefulWidget {
  const ListDelivered({Key? key}) : super(key: key);

  @override
  _ListDeliveredState createState() => _ListDeliveredState();
}

class _ListDeliveredState extends State<ListDelivered> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget> [
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Code: 0123456789',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 50),

                        Text(
                          'Date: 24/12/2021',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row (
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        //SizedBox(width: 50),
                        Icon(Icons.attach_money),
                        Text(
                          '1038.90',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 365,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailOrderScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Detail",
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
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
            Container(
              height: 1,
              width: 400,
              color: Colors.grey,
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Code: 0223456789',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 50),

                        Text(
                          'Date: 24/12/2021',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row (
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        //SizedBox(width: 50),
                        Icon(Icons.attach_money),
                        Text(
                          '798.60',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 365,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailOrderScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Detail",
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
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
            Container(
              height: 1,
              width: 400,
              color: Colors.grey,
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Code: 0323456789',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 50),

                        Text(
                          'Date: 24/12/2021',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row (
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        //SizedBox(width: 50),
                        Icon(Icons.attach_money),
                        Text(
                          '938.90',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 365,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailOrderScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Detail",
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
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
            Container(
              height: 1,
              width: 400,
              color: Colors.grey,
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
