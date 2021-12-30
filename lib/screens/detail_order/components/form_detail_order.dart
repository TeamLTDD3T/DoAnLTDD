import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';

class FormDetailOrder extends StatefulWidget {
  const FormDetailOrder({Key? key}) : super(key: key);

  @override
  _FormDetailOrderState createState() => _FormDetailOrderState();
}

class _FormDetailOrderState extends State<FormDetailOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget> [
          Center(
            child: Text(
              'Package (3 items)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 5),
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
                      SizedBox(width: 64),
                      Text(
                        'Quantity: 2',
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
                        'Price: ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 65),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '133.40',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row (
                    children: [
                      Text(
                        'Total Price: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '277.80',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Detail Product",
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
                  SizedBox(height: 20),
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
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image.asset("assets/images/Products/Pants/Pant_H&M1_LightKhakiGreen_FirstView_Front.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
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
                    'Rival Fleece Cloud Joggers',
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
                      SizedBox(width: 64),
                      Text(
                        'Quantity: 2',
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
                        'Price: ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 65),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '332.90',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row (
                    children: [
                      Text(
                        'Total Price: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '679.78',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Add to cart",
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
                  SizedBox(height: 20),
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
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image.asset("assets/images/Products/Pants/Pant_H&M1_LightKhakiGreen_FirstView_Front.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
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
                    'Rival Fleece Cloud Joggers',
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
                      SizedBox(width: 64),
                      Text(
                        'Quantity: 2',
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
                        'Price: ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 65),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '332.90',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row (
                    children: [
                      Text(
                        'Total Price: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '679.78',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Add to cart",
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
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
          Container(
            height: 2,
            width: 400,
            color: Colors.grey[300],
            alignment: Alignment.center,
          ),
          SizedBox(height: 20),
          Row (
            children: [
              Text(
                'Total: ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              //SizedBox(width: 50),
              Icon(Icons.attach_money),
              Text(
                '1637.36',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Cancel",
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
