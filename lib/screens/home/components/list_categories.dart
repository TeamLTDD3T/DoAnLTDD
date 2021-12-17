import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';
import '../../../models/category.dart';
import '../../../constants.dart';

class ListCategories extends StatelessWidget {
  List<Category> categories = [
    Category(
        name: 'Shirts',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        image: 'assets/images/Categories/Shirts.jpg',
        subCategories: []
    ),
    Category(
        name: 'T-Shirts',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        image: 'assets/images/Categories/T-Shirts.jpg',
        subCategories: []
    ),
    Category(
        name: 'Outerwear',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        image: 'assets/images/Categories/Outerwear.jpg',
        subCategories: []
    ),
    Category(
        name: 'Pants',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        image: 'assets/images/Categories/Pants.jpg',
        subCategories: []
    ),
    Category(
        name: 'Sneakers',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        image: 'assets/images/Categories/Sneakers.jpg',
        subCategories: []
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
        child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.all(20),
              height: 150,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListProductsScreen(),
                      ),
                    );
                  },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          categories[index].image,
                          fit: BoxFit.cover,
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
                                ]
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            categories[index].name,
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
        ),
    );
  }
}