import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/models/picture.dart';
import 'package:three_t_fashion/models/product.dart';
import 'package:three_t_fashion/models/size.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';

class ItemDetailOrder extends StatefulWidget {
  final int idTaiKhoan;
  const ItemDetailOrder(
    this.idTaiKhoan, {
    Key? key,
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.tensize,
    required this.mauid,
    required this.ctspid,
  }) : super(key: key);

  final String name, brand, tensize;
  final int? price, quantity, id, ctspid, mauid;

  @override
  _ItemDetailOrderState createState() => _ItemDetailOrderState();
}

class _ItemDetailOrderState extends State<ItemDetailOrder> {
  tongTienTungSP(int quantity) {
    var tong = 0;
    return tong = (widget.price! * quantity);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              FutureBuilder<List>(
                future: ApiServicesGioHang.layAnh(widget.ctspid!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  return snapshot.hasData
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  widget.idTaiKhoan,
                                  ApiServicesCTSanPham.fetchProductDetail(
                                      snapshot.data![0]['chi_tiet_san_pham_id']
                                          .toInt()),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 0.1)),
                            child: SizedBox(
                              height: 200,
                              width: 150,
                              child: CachedNetworkImage(
                                imageUrl: 'http://10.0.2.2:8001/storage/' +
                                    snapshot.data![0]['hinh_anh'].toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ))
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: const SizedBox(
                            height: 200,
                            width: 150,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Size: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.tensize.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        'Quantity: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Icon(
                        Icons.attach_money,
                      ),
                      Text(
                        widget.price.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Total: ',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.attach_money,
                      ),
                      Text(
                        tongTienTungSP(widget.quantity!).toString(),
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
