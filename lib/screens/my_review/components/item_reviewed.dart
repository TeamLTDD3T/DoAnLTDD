import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/data_sources/api_yeuthich.dart';
import 'package:three_t_fashion/models/picture.dart';
import 'package:three_t_fashion/models/product.dart';
import 'package:three_t_fashion/models/size.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/my_wishlist/my_wishlist_screen.dart';
import 'package:three_t_fashion/screens/review/review_screen.dart';
import 'package:three_t_fashion/screens/reviewed/reviewed_screen.dart';

class ItemReviewed extends StatefulWidget {
  final int idTaiKhoan;
  const ItemReviewed(
    this.idTaiKhoan, {
    Key? key,
    required this.iddanhgia,
    required this.name,
    required this.brand,
    required this.price,
    required this.ctspid,
    required this.size,
    required this.star,
    required this.review,
  }) : super(key: key);

  final String name, brand, size, review;
  final int? price, iddanhgia, ctspid, star;

  @override
  _ItemReviewedState createState() => _ItemReviewedState();
}

class _ItemReviewedState extends State<ItemReviewed> {
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
                                        snapshot.data![0]
                                                ['chi_tiet_san_pham_id']
                                            .toInt())),
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
                    widget.brand.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.name.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Size: ' + widget.size.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Icon(
                        Icons.attach_money,
                      ),
                      Text(
                        widget.price.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewedScreen(
                              widget.idTaiKhoan,
                              id: widget.iddanhgia,
                              name: widget.name,
                              brand: widget.brand,
                              price: widget.price,
                              ctspid: widget.ctspid,
                              size: widget.size,
                              star: widget.star,
                              review: widget.review,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Detail",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                    ),
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
