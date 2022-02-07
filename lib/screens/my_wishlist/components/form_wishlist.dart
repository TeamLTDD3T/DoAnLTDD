import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_listsanpham.dart';
import 'package:three_t_fashion/data_sources/api_yeuthich.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/models/wishlist.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/my_wishlist/components/item_wishlist.dart';

class FormWishlist extends StatefulWidget {
  final idTaiKhoan;
  const FormWishlist(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _FormWishlistState createState() => _FormWishlistState();
}

class _FormWishlistState extends State<FormWishlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<WishList>>(
          future: ApiServicesYeuThich().layDanhSachYeuThich(widget.idTaiKhoan),
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
                        ItemWishList(
                          widget.idTaiKhoan,
                          reload: () {
                            setState(() {});
                          },
                          id: snapshot.data![i].id?.toInt(),
                          ctspid: snapshot.data![i].chiTietSanPhamId?.toInt(),
                          name: snapshot.data![i].tenSanPham.toString(),
                          brand: snapshot.data![i].tenThuongHieu.toString(),
                          price: int.parse(snapshot.data![i].gia.toString()),
                          picture: ApiServicesGioHang.layAnh(
                              snapshot.data![i].chiTietSanPhamId!),
                        ),
                      const SizedBox(height: 5),
                      if (snapshot.data!.length == 0)
                        Container(
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      (HomeScreens(0, widget.idTaiKhoan)),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                          ),
                        ),
                      const SizedBox(height: 10),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
