import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/account_detail/account_detail_screen.dart';
import 'package:three_t_fashion/screens/change_password/change_password.dart';
import 'package:three_t_fashion/screens/login/login_screen.dart';
import 'package:three_t_fashion/screens/my_review/my_review_screen.dart';
import 'package:three_t_fashion/screens/my_wishlist/my_wishlist_screen.dart';
import 'package:three_t_fashion/screens/order/order_screen.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';

class ListItemsAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(bottom: 10),
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountDetailScreen(),
                ),
              );
            },
            leading: Icon(Icons.person_outline, size: 35),
            title: Text(
              'Details',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderScreen(),
                ),
              );
            },
            leading: Icon(Icons.list_alt, size: 35),
            title: Text(
              'My Orders',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(),
                ),
              );
            },
            leading: Icon(Icons.favorite_border, size: 35),
            title: Text(
              'My Wishlist',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyReviewScreen(),
                ),
              );
            },
            leading: Icon(Icons.star_border, size: 35),
            title: Text(
              'My Reiviews',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordScreen(),
                ),
              );
            },
            leading: Icon(Icons.vpn_key_outlined, size: 35),
            title: Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreens(),
                ),
              );
            },
            leading: Icon(Icons.logout, size: 35),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
