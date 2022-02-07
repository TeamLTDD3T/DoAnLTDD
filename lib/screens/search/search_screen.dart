import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_search.dart';
import 'package:three_t_fashion/models/product.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';

import 'components/search.dart';

class SearchScreen extends StatefulWidget {
  final idTaiKhoan;
  final idLSP;
  const SearchScreen(this.idTaiKhoan, this.idLSP, {Key? key}) : super(key: key);

  @override
  SearchScreens createState() => SearchScreens();
}

class SearchScreens extends State<SearchScreen> {
  List<Product> products = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final products = await ApiServicesSearch().search(query, widget.idLSP);

    setState(() => this.products = products);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Search"),
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return buildProduct(product);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: "Search By Product's Name",
        onChanged: searchProduct,
      );

  Future searchProduct(String query) async => debounce(() async {
        final products = await ApiServicesSearch().search(query, widget.idLSP);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.products = products;
        });
      });

  Widget buildProduct(Product product) => ListTile(
        leading: SizedBox(
          height: 80,
          width: 80,
          child: CachedNetworkImage(
            imageUrl: 'http://10.0.2.2:8001/storage/' + product.hinhAnh!,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.black12,
            ),
          ),
        ),
        title: Text(product.tenSanPham!),
        subtitle: Text(product.tenThuongHieu!),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(widget.idTaiKhoan,
                  ApiServicesCTSanPham.fetchProductDetail(product.id!)),
            ),
          );
        },
      );
}
