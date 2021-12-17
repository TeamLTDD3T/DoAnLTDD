// import 'package:flutter/material.dart';
//
// import '../constants.dart';
//
// class MyBottomNavBar extends StatelessWidget {
//   const MyBottomNavBar({
//     Key? key,
//     required this.currentIndex,
//   }) : super(key: key);
//   final int currentIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp();
//   }
// }
//
// class MyBottomNavBars extends StatefulWidget {
//   @override
//   _MyBottomNavBarsState createState() => _MyBottomNavBarsState();
// }
//
//
//
// class _MyBottomNavBarsState extends State<MyBottomNavBars> {
//
//   @override
//   Widget build(BuildContext context) {
//     // return Container(
//     //   padding: const EdgeInsets.only(
//     //     left: kDefaultPadding * 2,
//     //     right: kDefaultPadding * 2,
//     //     bottom: kDefaultPadding,
//     //   ),
//     //   height: 80,
//     //   decoration: BoxDecoration(
//     //     color: Colors.white,
//     //     boxShadow: [
//     //       BoxShadow(
//     //         offset: const Offset(0, -10),
//     //         blurRadius: 35,
//     //         color: kPrimaryColor.withOpacity(0.38),
//     //       ),
//     //     ],
//     //   ),
//     // );
//
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.black,
//       selectedItemColor: Colors.blue,
//       unselectedItemColor: Colors.white,
//       iconSize: 30,
//       currentIndex: currentIndex,
//       onTap: (index) => setState(() => currentIndex = index),
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//           //backgroundColor: Colors.black,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.format_list_bulleted),
//           label: 'Categories',
//           //backgroundColor: Colors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart),
//           label: 'Cart',
//           backgroundColor: Colors.red,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Person',
//           //backgroundColor: Colors.orange,
//         ),
//       ],
//     ),
//   }
// }
