import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/data_sources/api_yeuthich.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/my_wishlist/my_wishlist_screen.dart';

class ItemWishList extends StatefulWidget {
  final int idTaiKhoan;
  ItemWishList(
    this.idTaiKhoan, {
    Key? key,
    this.reload,
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.ctspid,
    required this.picture,
  }) : super(key: key);

  final String name, brand;
  final int? price, id, ctspid;
  final Future<List> picture;
  VoidCallback? reload;

  @override
  _ItemWishListState createState() => _ItemWishListState();
}

class _ItemWishListState extends State<ItemWishList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            FutureBuilder<List>(
              future: widget.picture,
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
                                ApiServicesCTSanPham.fetchProductDetail(snapshot
                                    .data![0]['chi_tiet_san_pham_id']
                                    .toInt()),
                              ),
                            ),
                          ).then((value) => setState(() => widget.reload!()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.1)),
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
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 160,
                    ),
                    SizedBox(
                      height: 23,
                      child: IconButton(
                        padding: const EdgeInsets.only(bottom: 6),
                        splashRadius: 10,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Notification'),
                              content: const Text(
                                  'Do you want to delete this product'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                    ApiServicesYeuThich()
                                        .xoaYeuThich(widget.id!);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            (WishlistScreen(widget.idTaiKhoan)),
                                      ),
                                    );
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                Text(
                  widget.brand,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
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
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      var flag = await ApiServicesGioHang()
                          .themSanPhamVaoGio(widget.idTaiKhoan, widget.ctspid!);
                      if (flag == 1) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Notification'),
                            content: const Text('Add Cart Success'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
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
                            content: const Text(
                                'The number of products in your cart has reached the limit !'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Add cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 1,
          width: 400,
          color: Colors.grey,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
