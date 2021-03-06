import 'package:flutter/material.dart';
import 'package:three_t_fashion/components/my_bottom_nav_bar.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/models/account.dart';
import 'package:three_t_fashion/screens/home/components/body.dart';
import 'package:three_t_fashion/screens/home/components/categories_body.dart';
import 'package:three_t_fashion/screens/home/components/account_body.dart';

import 'components/cart_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class HomeScreens extends StatefulWidget {
  final int idTaiKhoan;
  final int index;
  const HomeScreens(this.index, this.idTaiKhoan, {Key? key}) : super(key: key);
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  late int currentIndex = widget.index;
  late int id = widget.idTaiKhoan;
  var idLoaiTaiKhoan = 0;

  layIdLoaiTaiKhoan(int idTaiKhoan) async {
    Account acc = await ApiServicesTaiKhoan().layThongTinTaiKhoan(idTaiKhoan);
    setState(() {
      idLoaiTaiKhoan = acc.loaiTaiKhoanId!;
    });
  }

  @override
  void initState() {
    super.initState();
    layIdLoaiTaiKhoan(widget.idTaiKhoan);
  }

  late final screens = [
    Body(id),
    CategoriesBody(id),
    CartBody(id),
    AccountBody(id, idLoaiTaiKhoan),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
