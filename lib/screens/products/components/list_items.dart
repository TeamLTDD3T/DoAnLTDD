import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'dart:async';
import 'dart:convert';
import 'package:three_t_fashion/models/product.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';
import 'package:three_t_fashion/data_sources/api_listsanpham.dart';
import '../../../models/product.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

class ListItems extends StatefulWidget {
  final int idTaiKhoan;
  final Future<List<Product>> list;
  const ListItems(this.idTaiKhoan, this.list, {Key? key}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Flexible(
      child: FutureBuilder<List<Product>>(
        future: widget.list,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 170,
                    childAspectRatio: 2 / 4,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) => ListItem(
                      context, snapshot.data![index], widget.idTaiKhoan))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

Widget ListItem(BuildContext context, Product sp, int idtk) {
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                  idtk, ApiServicesCTSanPham.fetchProductDetail(sp.id!)),
            ),
          );
        },
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1)),
                  child: CachedNetworkImage(
                    imageUrl: 'http://10.0.2.2:8001/storage/${sp.hinhAnh}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.black12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${sp.tenSanPham}\n",
                              style: Theme.of(context).textTheme.button,
                            ),
                            TextSpan(
                              text: sp.tenThuongHieu,
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$" + sp.gia.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: kPrimaryColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      var flag = await ApiServicesGioHang()
                          .themSanPhamVaoGio(idtk, sp.id!);
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
                            content: const Text(
                                'The number of products in your cart has reached the limit !'),
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                )
              ],
            )),
      ),
    ],
  );
}
