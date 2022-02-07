import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_danhgia.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/my_review/my_review_screen.dart';

class FormReview extends StatefulWidget {
  final idTaiKhoan;
  const FormReview(
    this.idTaiKhoan, {
    Key? key,
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.ctspid,
    required this.size,
  }) : super(key: key);

  final String name, brand, size;
  final int? price, id, ctspid;

  @override
  _FormReviewState createState() => _FormReviewState();
}

class _FormReviewState extends State<FormReview> {
  final txtDanhGia = TextEditingController();
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Row(
            children: [
              FutureBuilder<List>(
                future: ApiServicesGioHang.layAnh(widget.ctspid!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  return snapshot.hasData
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                    widget.idTaiKhoan,
                                    ApiServicesCTSanPham.fetchProductDetail(
                                        snapshot.data![0]
                                                ['chi_tiet_san_pham_id']
                                            .toInt())),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 0.1)),
                            child: SizedBox(
                              height: 200,
                              width: 150,
                              child: CachedNetworkImage(
                                imageUrl: 'http://10.0.2.2:8001/storage/' +
                                    snapshot.data![0]['hinh_anh'].toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ))
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: const SizedBox(
                            height: 200,
                            width: 150,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                },
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.name.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Size: ' + widget.size.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Icon(
                        Icons.attach_money,
                      ),
                      Text(
                        widget.price.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Rate:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  RatingBar.builder(
                    minRating: 1,
                    itemSize: 30,
                    itemBuilder: (context, index) =>
                        const Icon(Icons.star, color: Colors.orange),
                    updateOnDrag: true,
                    onRatingUpdate: (rating) => setState(() {
                      this.rating = rating;
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            child: TextFormField(
              controller: txtDanhGia,
              minLines: 5,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Enter review here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 20),
          Container(
            width: 400,
            child: ElevatedButton(
              onPressed: () async {
                if (this.rating == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Rate this product',
                        style: TextStyle(fontSize: 20),
                      ),
                      content: const Text('Please leave a star rating!'),
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
                } else if (txtDanhGia.text == '') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Rate this product',
                        style: TextStyle(fontSize: 20),
                      ),
                      content: const Text('Please enter a review!'),
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
                } else {
                  var status = await ApiServicesDanhGia().themDanhGia(
                      widget.idTaiKhoan,
                      widget.id!,
                      widget.ctspid!,
                      rating,
                      txtDanhGia.text);
                  if (status == 1) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Notification',
                          style: TextStyle(fontSize: 20),
                        ),
                        content: const Text('Review success!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyReviewScreen(widget.idTaiKhoan),
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
                        title: const Text(
                          'Notification',
                          style: TextStyle(fontSize: 20),
                        ),
                        content: const Text('Review fail!'),
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
                }
              },
              child: const Text(
                "Review",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
