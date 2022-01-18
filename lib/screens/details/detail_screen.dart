import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/screens/check_out/check_out_screen.dart';
import 'package:three_t_fashion/screens/details/components/body.dart';
import 'package:three_t_fashion/screens/home/components/cart_body.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/models/productdetail.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class DetailsScreen extends StatefulWidget {
  final int idTaiKhoan;
  final Future<List<ProductDetail>> list;
  const DetailsScreen(this.idTaiKhoan, this.list, {Key? key}) : super(key: key);
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
        title: const Text(
          'Detail Product',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Body(widget.list),
      bottomNavigationBar: Row(
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            onPressed: _changeIcon,
            icon: Icon(icon, size: 40, color: Colors.red),
          ),
          Container(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            width: 170,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CheckOutScreens(),
                //   ),
                // );
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
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder<List<ProductDetail>>(
            future: widget.list,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? Container(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      width: 150,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () async {
                          var flag = await ApiServices().themSanPhamVaoGio(
                              widget.idTaiKhoan, snapshot.data![0].id!);
                          if (flag == 1) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Notification'),
                                content: const Text('Add Cart Success'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Notification'),
                                content: const Text(
                                    'The number of products in your cart has reached the limit !'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Add cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          )
        ],
      ),
    );
  }

  void _changeIcon() {
    setState(() {
      isChoose = !isChoose;
      if (icon == Icons.favorite_border) {
        icon = Icons.favorite;
      } else
        icon = Icons.favorite_border;
    });
  }
}
