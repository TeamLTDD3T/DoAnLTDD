import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_danhgia.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/models/notreview.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/my_review/components/item_not_review.dart';
import 'package:three_t_fashion/screens/review/review_screen.dart';

class ListNotReview extends StatefulWidget {
  final idTaiKhoan;
  const ListNotReview(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _ListNotReviewState createState() => _ListNotReviewState();
}

class _ListNotReviewState extends State<ListNotReview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: FutureBuilder<List<NotReview>>(
          future:
              ApiServicesDanhGia().layDanhSachChuaDanhGia(widget.idTaiKhoan),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return snapshot.hasData
                ? Column(
                    children: <Widget>[
                      for (var i = 0; i < snapshot.data!.length; i++)
                        ItemNotReview(
                          widget.idTaiKhoan,
                          id: snapshot.data![i].id?.toInt(),
                          ctspid: snapshot.data![i].chiTietSanPhamId?.toInt(),
                          name: snapshot.data![i].tenSanPham.toString(),
                          brand: snapshot.data![i].tenThuongHieu.toString(),
                          price: int.parse(snapshot.data![i].gia.toString()),
                          size: snapshot.data![i].tenSize.toString(),
                        ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
