import 'package:flutter/material.dart';

class FormReview extends StatefulWidget {
  const FormReview({Key? key}) : super(key: key);

  @override
  _FormReviewState createState() => _FormReviewState();
}

class _FormReviewState extends State<FormReview> {
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
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            child: TextFormField(
              minLines: 5,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter review here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          SizedBox(height: 20),
          Container(
            width: 400,
            child: ElevatedButton(
              onPressed: () {},
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
    );
  }
}
