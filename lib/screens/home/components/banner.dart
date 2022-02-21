import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_banner.dart';
import 'package:three_t_fashion/models/banner.dart';

class Banners extends StatefulWidget {
  Banners() : super();

  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  late CarouselSlider carouselSlider;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<BannerPic>>(
        future: ApiServicesBanner().fetchBanner(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return snapshot.hasData
              ? Column(
                  children: <Widget>[
                    carouselSlider = CarouselSlider(
                      items: [
                        for (int i = 0; i < snapshot.data!.length; i++)
                          Container(
                            margin: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: 'http://10.0.2.2:8001/storage/' + snapshot.data![i].hinhAnhBanner!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                      ],
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                        // onPageChanged: (index, reason) {
                        //   setState(() {
                        //     _current = index;
                        //   });
                        // }
                      ),
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
