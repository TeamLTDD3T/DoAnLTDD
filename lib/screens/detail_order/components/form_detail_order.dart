import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_don_hang.dart';
import 'package:three_t_fashion/models/cartdetail.dart';
import 'package:three_t_fashion/models/orderdetail.dart';
import 'package:three_t_fashion/screens/detail_order/components/item_detail_order.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/home/components/item_cart.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';

class FormDetailOrder extends StatefulWidget {
  final idTaiKhoan;
  final idDonHang;
  final trangThaiDonHang;
  const FormDetailOrder(this.trangThaiDonHang, this.idTaiKhoan, this.idDonHang,
      {Key? key})
      : super(key: key);

  @override
  _FormDetailOrderState createState() => _FormDetailOrderState();
}

class _FormDetailOrderState extends State<FormDetailOrder> {
  tongSoLuong(List<OrderDetail> list) {
    var tong = 0;
    for (var i = 0; i < list.length; i++) {
      tong = tong + list[i].soLuong!;
    }
    return tong;
  }

  tongTien(List<OrderDetail> list) {
    var tong = 0;
    for (var i = 0; i < list.length; i++) {
      tong = tong + list[i].gia! * list[i].soLuong!;
    }
    return tong;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List<OrderDetail>>(
        future: ApiServicesDonHang().LayCTDonHang(widget.idDonHang),
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
                      ItemDetailOrder(
                        widget.idTaiKhoan,
                        id: snapshot.data![i].id?.toInt(),
                        ctspid: snapshot.data![i].chiTietSanPhamId?.toInt(),
                        name: snapshot.data![i].tenSanPham.toString(),
                        brand: snapshot.data![i].tenThuongHieu.toString(),
                        price: int.parse(snapshot.data![i].gia.toString()),
                        quantity:
                            int.parse(snapshot.data![i].soLuong.toString()),
                        tensize: snapshot.data![i].tenSize.toString(),
                        mauid: snapshot.data![i].mauId?.toInt(),
                      ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Total quantity:',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(Icons.checkroom),
                        Text(
                          tongSoLuong(snapshot.data!).toString(),
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Total price:',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.attach_money,
                        ),
                        Text(
                          tongTien(snapshot.data!).toString(),
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (widget.trangThaiDonHang == 0)
                      Container(
                        width: 370,
                        child: ElevatedButton(
                          onPressed: () async {
                            var flag = await ApiServicesDonHang()
                                .huyDonHang(widget.idDonHang);
                            if (flag == 1) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Notification'),
                                  content: const Text('Cancel Success'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => (HomeScreens(
                                                3, widget.idTaiKhoan)),
                                          ),
                                        );
                                      },
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
                                  content: const Text('Cancel fail'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(15)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        ),
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
