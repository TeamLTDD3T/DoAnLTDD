import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_danhgia.dart';
import 'package:three_t_fashion/models/review.dart';
import 'package:three_t_fashion/screens/see_all_review/see_all_review_screen.dart';

class TabReview extends StatelessWidget {
  final ctspid;
  final double tbsao;
  const TabReview(this.ctspid, this.tbsao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const Center(
            child: Text(
              'Ratings & Reviews',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  tbsao.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              for (var i = 0; i < 5; i++)
                if (i < tbsao)
                  const Icon(Icons.star, color: Colors.orange)
                else
                  const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 10),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<Review>>(
            future: ApiServicesDanhGia().layDanhGiaTheoSanPham(ctspid),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? Column(
                      children: [
                        if (snapshot.data!.length > 3)
                          for (var i = 0; i < 3; i++)
                            Container(
                              child: Column(
                                children: [
                                  Row(children: [
                                    for (var j = 0; j < 5; j++)
                                      if (j < snapshot.data![i].soSao!)
                                        const Icon(Icons.star,
                                            color: Colors.orange)
                                      else
                                        const Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        ),
                                    const Spacer(),
                                    Text(
                                      snapshot.data![i].createdAt!
                                          .toString()
                                          .substring(0, 10),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'By ' +
                                            snapshot.data![i].email!.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![i].noiDung!.toString(),
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Size: ' +
                                            snapshot.data![i].tenSize!
                                                .toString(),
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    width: 400,
                                    color: Colors.grey,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            )
                        else
                          for (var i = 0; i < snapshot.data!.length; i++)
                            Container(
                              child: Column(
                                children: [
                                  Row(children: [
                                    for (var j = 0; j < 5; j++)
                                      if (j < snapshot.data![i].soSao!)
                                        const Icon(Icons.star,
                                            color: Colors.orange)
                                      else
                                        const Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        ),
                                    const Spacer(),
                                    Text(
                                      snapshot.data![i].createdAt!
                                          .toString()
                                          .substring(0, 10),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'By ' +
                                            snapshot.data![i].email!.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![i].noiDung!.toString(),
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Size: ' +
                                            snapshot.data![i].tenSize!
                                                .toString(),
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    width: 400,
                                    color: Colors.grey,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                        if (snapshot.data!.length > 3)
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SeeAllReviewScreen(ctspid, tbsao),
                                ),
                              );
                            },
                            child: const Text(
                              'See all reviews',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                          )
                      ],
                    )
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
        ],
      ),
    );
  }
}
