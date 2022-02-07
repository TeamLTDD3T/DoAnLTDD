import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'package:three_t_fashion/models/productdetail.dart';
import 'package:three_t_fashion/screens/details/components/tab.dart';

import 'product_picture.dart';
import 'title_with_price.dart';

class Body extends StatelessWidget {
  final Future<List<ProductDetail>> list;
  const Body(this.list, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProductPictures(this.list),
          FutureBuilder<List<ProductDetail>>(
            future: this.list,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? TitleAndPrice(
                      brand: snapshot.data![0].tenThuongHieu!,
                      name: snapshot.data![0].tenSanPham!,
                      price: snapshot.data![0].gia!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          const SizedBox(height: kDefaultPadding),
          FutureBuilder<List<ProductDetail>>(
            future: list,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? Tabs(snapshot.data![0].moTa!, snapshot.data![0].id!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
