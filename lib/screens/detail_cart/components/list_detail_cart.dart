import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/models/cartdetail.dart';
import 'package:three_t_fashion/screens/detail_cart/components/item_detail_cart.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/home/components/item_cart.dart';

class ListDetailCart extends StatefulWidget {
  final int idTaiKhoan;
  final Future<List<CartDetail>> list;
  const ListDetailCart(this.idTaiKhoan, this.list, {Key? key})
      : super(key: key);

  @override
  _ListDetailCartState createState() => _ListDetailCartState();
}

class _ListDetailCartState extends State<ListDetailCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<List<CartDetail>>(
        future: widget.list,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Package ${snapshot.data!.length} item${snapshot.data!.length > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 1,
                      width: 400,
                      color: Colors.grey,
                      alignment: Alignment.center,
                    ),
                    for (var i = 0; i < snapshot.data!.length; i++)
                      ItemDetailCart(
                        widget.idTaiKhoan,
                        id: snapshot.data![i].id?.toInt(),
                        ctspid: snapshot.data![i].chiTietSanPhamId?.toInt(),
                        name: snapshot.data![i].tenSanPham.toString(),
                        brand: snapshot.data![i].tenThuongHieu.toString(),
                        price: int.parse(snapshot.data![i].gia.toString()),
                        quantity:
                            int.parse(snapshot.data![i].soLuong.toString()),
                        sizeid: snapshot.data![i].sizeId?.toInt(),
                        mauid: snapshot.data![i].mauId?.toInt(),
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
