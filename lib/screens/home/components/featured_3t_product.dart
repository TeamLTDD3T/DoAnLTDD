import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_ctsanpham.dart';
import 'package:three_t_fashion/data_sources/api_giohang.dart';
import 'package:three_t_fashion/data_sources/api_listsanpham.dart';
import 'package:three_t_fashion/models/product.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';

import '../../../constants.dart';

class FeaturedProducts extends StatelessWidget {
  final int idTaiKhoan;
  const FeaturedProducts(this.idTaiKhoan, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder<List<Product>>(
        future: ApiServices().fetchProductFea(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? Row(
                  children: [
                    for (var i = 0; i <= snapshot.data!.length / 2; i++)
                      FeaturedProductCard(
                        idTaiKhoan: idTaiKhoan,
                        idChiTietSanPham: snapshot.data![i].id!,
                        image: 'http://10.0.2.2:8001/storage/' + snapshot.data![i].hinhAnh.toString(),
                        title: snapshot.data![i].tenSanPham.toString(),
                        brand: snapshot.data![i].tenThuongHieu.toString(),
                        price: int.parse(snapshot.data![i].gia.toString()),
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(idTaiKhoan, ApiServicesCTSanPham.fetchProductDetail(snapshot.data![i].id!)),
                            ),
                          );
                        },
                      ),
                  ],
                )
              : const Center(
                  widthFactor: 11,
                  heightFactor: 3,
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class FeaturedProductCard extends StatelessWidget {
  const FeaturedProductCard({
    Key? key,
    required this.idTaiKhoan,
    required this.idChiTietSanPham,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, brand;
  final int price, idTaiKhoan, idChiTietSanPham;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1.5,
      ),
      width: size.width * 0.42,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
                // padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.1)),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: "$title\n".toUpperCase(), style: Theme.of(context).textTheme.button),
                                TextSpan(
                                  text: "$brand".toUpperCase(),
                                  style: TextStyle(
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$$price',
                            style: Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.only(bottom: 10, right: 20),
                      width: 150,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () async {
                          var flag = await ApiServicesGioHang().themSanPhamVaoGio(idTaiKhoan, idChiTietSanPham);
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
                                content: const Text('The number of products in your cart has reached the limit !'),
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
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
