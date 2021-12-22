import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';

class ProductPicture extends StatelessWidget {
  const ProductPicture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ProductPictures extends StatefulWidget {
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
      child: Column(
        children: <Widget>[
          carouselSlider = CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Products/Shirts/Shirt_H&M1_Black-White_Front.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Products/Shirts/Shirt_H&M1_Black-White_Back.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Products/Shirts/Shirt_H&M1_Black-White_Detail.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Products/Shirts/Shirt_H&M1_Black-White_FullView.jpg'),
                    fit: BoxFit.cover,
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
      ),
    );
  }
}
