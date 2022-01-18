import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_listsanpham.dart';
import 'package:three_t_fashion/data_sources/api_loaisanpham.dart';
import 'package:three_t_fashion/models/producttype.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';
import '../../../models/category.dart';

class ListCategories extends StatelessWidget {
  final int idTaiKhoan;
  const ListCategories(this.idTaiKhoan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: FutureBuilder<List<ProductType>>(
        future: ApiServicesProductType.fetchProductType(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      height: 150,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListProductsScreen(
                                  this.idTaiKhoan,
                                  ApiServices.fetchProductByType(
                                      snapshot.data![index].id!)),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: 'http://10.0.2.2:8001/storage/' +
                                      snapshot.data![index].hinhAnhLoaiSp!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.transparent,
                                        ])),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    snapshot.data![index].tenLoaiSanPham!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
