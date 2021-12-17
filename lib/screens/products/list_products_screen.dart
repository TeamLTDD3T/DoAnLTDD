import 'package:flutter/material.dart';
import 'package:three_t_fashion/components/my_bottom_nav_bar.dart';
import 'package:three_t_fashion/screens/products/components/body.dart';
import 'package:three_t_fashion/screens/home/components/categories_body.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ListProductsScreen extends StatefulWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  _ListProductsScreenState createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}


