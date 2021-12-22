import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/details/components/body.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class DetailsScreen extends StatefulWidget {

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isChoose = false;
  var icon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Detail Product',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Body(),
      bottomNavigationBar: Row (
        children: <Widget> [
          IconButton(
            padding: EdgeInsets.only(left: 20, bottom: 10),
              onPressed: _changeIcon,
              icon: Icon(icon, size: 40, color: Colors.red),
          ),
          Container(
            padding: EdgeInsets.only(left: 40, bottom: 10),
            width: 170,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreens(),
                  ),
                );
              },
              child: const Text(
                "Buy Now",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black,),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            width: 150,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreens(),
                  ),
                );
              },
              child: const Text(
                "Add cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _changeIcon () {
    setState (() {
      isChoose =! isChoose;
      if (icon == Icons.favorite_border) {
        icon = Icons.favorite;
      }
      else
        icon = Icons.favorite_border;
    });
  }
}
