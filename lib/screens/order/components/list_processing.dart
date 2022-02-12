import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_don_hang.dart';
import 'package:three_t_fashion/models/order.dart';
import 'package:three_t_fashion/screens/detail_order/detail_order_screen.dart';

class ListProcessing extends StatefulWidget {
  final idTaiKhoan;
  const ListProcessing(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  _ListProcessingState createState() => _ListProcessingState();
}

class _ListProcessingState extends State<ListProcessing> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Order>>(
          future: ApiServicesDonHang().layDonHang(widget.idTaiKhoan),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return snapshot.hasData
                ? Column(
                    children: <Widget>[
                      const SizedBox(height: 10),
                      // if (snapshot.data!.isEmpty)
                      //   const Text(
                      //     'No orders yet',
                      //     style: TextStyle(
                      //         fontSize: 25, fontStyle: FontStyle.italic),
                      //   ),
                      for (var i = 0; i < snapshot.data!.length; i++)
                        if (snapshot.data![i].trangThai == 0)
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'ID: ' +
                                            snapshot.data![i].id.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 180),
                                      Text(
                                        'Date: ' +
                                            snapshot.data![i].createdAt
                                                .toString()
                                                .substring(0, 10),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 370,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderScreen(
                                                    snapshot.data![i].trangThai,
                                                    widget.idTaiKhoan,
                                                    snapshot.data![i].id),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Detail",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.all(15)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    width: 365,
                                    color: Colors.grey,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ],
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
