import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_listsanpham.dart';
import 'package:three_t_fashion/models/cartdetail.dart';
import 'package:three_t_fashion/screens/check_out/check_out_screen.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';

class BottomCart extends StatelessWidget {
  final int idTaiKhoan;
  final Future<List<CartDetail>> list;
  const BottomCart(this.idTaiKhoan, this.list, {Key? key}) : super(key: key);

  // tongTien(List<CartDetail> list) {
  //   var tong = 0;
  //   for (int i = 0; i < list.length; i++) {
  //     tong = tong + list[i].gia! * list[i].soLuong!;
  //   }
  //   return tong;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 5),
      child: FutureBuilder<List<CartDetail>>(
        future: this.list,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? Column(
                  children: [
                    snapshot.data!.length > 0
                        ? Container(
                            width: 400,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CheckOutScreens(idTaiKhoan),
                                  ),
                                );
                              },
                              child: const Text(
                                "Go to checkout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                            ),
                          )
                        : Container(
                            width: 400,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        (HomeScreens(0, idTaiKhoan)),
                                  ),
                                );
                              },
                              child: const Text(
                                "Shopping now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                            ),
                          ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
