import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_danhgia.dart';
import 'package:three_t_fashion/models/notreview.dart';
import 'package:three_t_fashion/models/reviewed.dart';
import 'package:three_t_fashion/screens/my_review/components/item_reviewed.dart';
import 'package:three_t_fashion/screens/review/review_screen.dart';

class ListReview extends StatefulWidget {
  final idTaiKhoan;
  const ListReview(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _ListReviewState createState() => _ListReviewState();
}

class _ListReviewState extends State<ListReview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: FutureBuilder<List<Reviewed>>(
          future: ApiServicesDanhGia().layDanhSachDaDanhGia(widget.idTaiKhoan),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return snapshot.hasData
                ? Column(
                    children: <Widget>[
                      for (var i = 0; i < snapshot.data!.length; i++)
                        ItemReviewed(
                          widget.idTaiKhoan,
                          iddanhgia: snapshot.data![i].id?.toInt(),
                          ctspid: snapshot.data![i].chiTietSanPhamId?.toInt(),
                          name: snapshot.data![i].tenSanPham.toString(),
                          brand: snapshot.data![i].tenThuongHieu.toString(),
                          price: int.parse(snapshot.data![i].gia.toString()),
                          size: snapshot.data![i].tenSize.toString(),
                          star: int.parse(snapshot.data![i].soSao.toString()),
                          review: snapshot.data![i].noiDung.toString(),
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
