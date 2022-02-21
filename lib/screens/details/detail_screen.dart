import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/data_sources/api_yeuthich.dart';
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
  var icon = Icons.favorite_border;
  var trangThai = 0;

  checkStatus() async {
    var listtemp = await widget.list;
    trangThai = await ApiServicesYeuThich().layTrangThai(widget.idTaiKhoan, listtemp[0].id!);
    if (trangThai == 1) {
      setState(() {
        icon = Icons.favorite;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(onPressed: () {
        //   Navigator.pop(context, true);
        // }),
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
            splashRadius: 0.1,
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            onPressed: () async {
              setState(() {
                if (icon == Icons.favorite_border) {
                  icon = Icons.favorite;
                } else {
                  icon = Icons.favorite_border;
                }
              });
              var listtemp = await widget.list;
              var flag = await ApiServicesYeuThich().capNhatTrangThai(widget.idTaiKhoan, listtemp[0].id!);
            },
            icon: Icon(icon, size: 40, color: Colors.red),
          ),
          const Spacer(),
          FutureBuilder<List<ProductDetail>>(
            future: widget.list,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 10, right: 20),
                      width: 250,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () async {
                          var flag = await ApiServicesGioHang().themSanPhamVaoGio(widget.idTaiKhoan, snapshot.data![0].id!);
                          if (flag == 1) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Notification'),
                                content: const Text('Add Cart Success'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
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
                                content: const Text('The number of products in your cart has reached the limit !'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
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
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
}
