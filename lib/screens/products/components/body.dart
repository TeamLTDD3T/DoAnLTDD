import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'header_with_searchbox.dart';
import 'list_items.dart';
import 'package:three_t_fashion/models/product.dart';

class Body extends StatelessWidget {
  final int idTaiKhoan;
  final Future<List<Product>> list;
  const Body(this.idTaiKhoan, this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FutureBuilder<List<Product>>(
          future: list,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return snapshot.hasData
                ? HeaderWithSearchBox(
                    snapshot.data![0].loaiSanPhamId, idTaiKhoan,
                    size: size)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),

        ListItems(idTaiKhoan, list),
        //const SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
