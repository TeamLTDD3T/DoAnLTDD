import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/review/review_screen.dart';

class ListNotReview extends StatefulWidget {
  const ListNotReview({Key? key}) : super(key: key);

  @override
  _ListNotReviewState createState() => _ListNotReviewState();
}

class _ListNotReviewState extends State<ListNotReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget> [
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image.asset("assets/images/Products/T-shirts/T-Shirt_Nike2_Black_FirstView_Front.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Under Arrmour',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Text(
                    'UA Branded Crop',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Size: X',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
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
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 65),
                      Icon(Icons.attach_money),
                      Text(
                        '138.90',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Review",
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
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image.asset("assets/images/Products/T-shirts/T-Shirt_Nike2_Black_FirstView_Front.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Under Arrmour',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Text(
                    'UA Branded Crop',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Size: X',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
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
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 65),
                      Icon(Icons.attach_money),
                      Text(
                        '138.90',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Review",
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
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
