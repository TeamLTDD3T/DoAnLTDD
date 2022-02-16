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

class ItemDetailCart extends StatefulWidget {
  final int idTaiKhoan;
  ItemDetailCart(
    this.idTaiKhoan, {
    Key? key,
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.sizeid,
    required this.mauid,
    required this.ctspid,
  }) : super(key: key);

  final String name, brand;
  final int? price, quantity, sizeid, id, ctspid, mauid;

  @override
  _ItemDetailCartState createState() => _ItemDetailCartState();
}

class _ItemDetailCartState extends State<ItemDetailCart> {
  List sizes = [];
  final quantity = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  late String? value1 = widget.sizeid.toString();
  late String? value2 = widget.quantity.toString();
  tongTienTungSP(int quantity) {
    var tong = 0;
    return tong = (widget.price! * quantity);
  }

  Future laysize(int idctsp) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8001/api/size/lay-size/$idctsp'));
    var responseJson = await jsonDecode(response.body);

    setState(() {
      sizes = responseJson;
    });
  }

  @override
  void initState() {
    laysize(widget.ctspid!);
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
                      ? Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.1)),
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
                        )
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
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Text(
                        'Size',
                      ),
                      SizedBox(width: 75),
                      Text(
                        'Quantity',
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: value1,
                              iconSize: 30,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              items: sizes.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item['ten_size'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  value: item['id'].toString(),
                                );
                              }).toList(),
                              onChanged: null),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(20),
                            value: value2,
                            iconSize: 30,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            // isExpanded: true,
                            items: quantity.map(buildMenuItem).toList(),
                            onChanged: null,
                          ),
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Total: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.attach_money,
                      ),
                      Text(
                        tongTienTungSP(int.parse(value2.toString())).toString(),
                        style: const TextStyle(
                          fontSize: 18,
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
}
