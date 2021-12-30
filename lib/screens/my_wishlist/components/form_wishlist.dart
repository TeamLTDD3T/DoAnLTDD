import 'package:flutter/material.dart';

class FormWishlist extends StatefulWidget {
  const FormWishlist({Key? key}) : super(key: key);

  @override
  _FormWishlistState createState() => _FormWishlistState();
}

class _FormWishlistState extends State<FormWishlist> {
  final items = ['XS', 'S', 'M', 'L', 'XL', '2XL'];
  String? value1;
  String? value2;
  String? value3;
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
                        'Size',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget> [
                      Container(
                        width: 190,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value1,
                            iconSize: 30,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            // isExpanded: true,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value1) => setState(() => this.value1 = value1),
                          ),
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
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 50),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '138.90',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'In Stock',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeScreens(),
                        //   ),
                        // );
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
                        'Size',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget> [
                      Container(
                        width: 190,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value2,
                            iconSize: 30,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            // isExpanded: true,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value2) => setState(() => this.value2 = value2),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row (
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 50),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '339.89',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'In Stock',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeScreens(),
                        //   ),
                        // );
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
                        'Size',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget> [
                      Container(
                        width: 190,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value3,
                            iconSize: 30,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            // isExpanded: true,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value3) => setState(() => this.value3 = value3),
                          ),
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
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 50),
                      Icon(Icons.attach_money, color: Colors.red,),
                      Text(
                        '339.89',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'In Stock',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeScreens(),
                        //   ),
                        // );
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
            color: Colors.grey[300],
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
