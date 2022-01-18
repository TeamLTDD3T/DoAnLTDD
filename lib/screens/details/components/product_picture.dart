import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/models/productdetail.dart';

import '../../../constants.dart';

class ProductPicture extends StatelessWidget {
  const ProductPicture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ProductPictures extends StatefulWidget {
  final Future<List<ProductDetail>> list;
  const ProductPictures(this.list, {Key? key}) : super(key: key);
  @override
  _ProductPicturesState createState() => _ProductPicturesState();
}

class _ProductPicturesState extends State<ProductPictures> {
  late CarouselSlider carouselSlider;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FutureBuilder<List<ProductDetail>>(
        future: widget.list,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? Column(
                  children: <Widget>[
                    carouselSlider = CarouselSlider(
                      items: [
                        for (var i = 0; i < snapshot.data!.length; i++)
                          Container(
                            child: CachedNetworkImage(
                              imageUrl: 'http://10.0.2.2:8001/storage/' +
                                  snapshot.data![i].hinhAnh!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                      ],
                      options: CarouselOptions(
                          height: 550.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
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
