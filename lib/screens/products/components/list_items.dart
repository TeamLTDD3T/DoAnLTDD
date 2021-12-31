import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:three_t_fashion/data_sources/api_services.dart';
import 'package:three_t_fashion/models/product.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';
import '../../../models/product.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

class ListItems extends StatefulWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

Future<List<Product>> fetchProduct() async {
  List<Product> list = [];
  try {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/san-pham/danh-sach'));
    List responseJson = await json.decode(response.body);
    if (response.statusCode == 200) {
      list = responseJson.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load product');
    }
  } catch (Exception) {}
  return list;
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
        future: fetchProduct(),
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
                  itemBuilder: (BuildContext context, int index) =>
                      ListItem(context, snapshot.data![index]))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

Widget ListItem(BuildContext context, Product sp) {
  return Column(
    children: <Widget>[
      CachedNetworkImage(
        imageUrl: 'http://10.0.2.2:8000/storage/${sp.hinhAnh}',
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.black12,
        ),
      ),
      // Image.asset(),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
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
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 50,
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
      ),
    ],
  );
}
