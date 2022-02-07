import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/models/account.dart';
import 'package:three_t_fashion/models/cartdetail.dart';

import 'form_check_out.dart';

class Body extends StatelessWidget {
  final idTaiKhoan;
  const Body(this.idTaiKhoan, {Key? key}) : super(key: key);

  tongTien(List<CartDetail> list) {
    var tong = 0;
    for (int i = 0; i < list.length; i++) {
      tong = tong + list[i].gia! * list[i].soLuong!;
    }
    return tong;
  }

  tongSoLuongSP(List<CartDetail> list) {
    var tong = 0;
    for (int i = 0; i < list.length; i++) {
      tong = tong + list[i].soLuong!;
    }
    return tong;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder<List<CartDetail>>(
            future: ApiServicesGioHang.LayGioHang(idTaiKhoan),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Text(
                            'Shopping cart summary',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total number of products:',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.checkroom),
                              Text(
                                tongSoLuongSP(snapshot.data!).toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total price of all products:',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.attach_money),
                              Text(
                                tongTien(snapshot.data!).toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 1,
                            width: 400,
                            color: Colors.grey,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          FutureBuilder<Account>(
            future: ApiServicesTaiKhoan().layThongTinTaiKhoan(idTaiKhoan),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? FormCheckout(snapshot.data!.diachi!, snapshot.data!.hoten!,
                      snapshot.data!.sdt!, snapshot.data!.id!)
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
