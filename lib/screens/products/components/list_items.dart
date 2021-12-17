import 'package:flutter/material.dart';
import 'package:three_t_fashion/screens/details/detail_screen.dart';
import 'package:three_t_fashion/screens/products/list_products_screen.dart';
import '../../../models/product.dart';
import '../../../constants.dart';



class ListItems extends StatelessWidget {
  List<Product> product = [
    Product(
        id: 0,
        name: 'Item1',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        brand: 'Nike',
        price: 30,
        image: 'assets/images/Products/Outerwear/Outerwear_Adidas1_Black-White_FirstView_Front.jpg',
    ),
    Product(
        id: 1,
        name: 'Item2',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        brand: 'Nike',
        price: 30,
        image: 'assets/images/Products/Outerwear/Outerwear_Adidas2_GreyThree-GreyFive_FirstView_Front.jpg',
    ),
    Product(
        id: 2,
        name: 'Item3',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        brand: 'Nike',
        price: 30,
        image: 'assets/images/Products/Outerwear/Outerwear_H&M1_KhakiGreen_FirstView_Front.jpg',
    ),
    Product(
        id: 3,
        name: 'Item4',
        icon: 'Icon(Icons.arrow_forward_ios)',
        color: Colors.black,
        brand: 'Nike',
        price: 30,
        image: 'assets/images/Products/Pants/Pant_H&M1_LightKhakiGreen_FirstView_Front.jpg',
    ),
    Product(
      id: 4,
      name: 'Item5',
      icon: 'Icon(Icons.arrow_forward_ios)',
      color: Colors.black,
      brand: 'Nike',
      price: 30,
      image: 'assets/images/Products/Outerwear/Outerwear_Adidas1_Black-White_FirstView_Front.jpg',
    ),
    Product(
      id: 5,
      name: 'Item6',
      icon: 'Icon(Icons.arrow_forward_ios)',
      color: Colors.black,
      brand: 'Nike',
      price: 30,
      image: 'assets/images/Products/Outerwear/Outerwear_Adidas2_GreyThree-GreyFive_FirstView_Front.jpg',
    ),
    Product(
      id: 6,
      name: 'Item7',
      icon: 'Icon(Icons.arrow_forward_ios)',
      color: Colors.black,
      brand: 'Nike',
      price: 30,
      image: 'assets/images/Products/Outerwear/Outerwear_H&M1_KhakiGreen_FirstView_Front.jpg',
    ),
    Product(
      id: 7,
      name: 'Item8',
      icon: 'Icon(Icons.arrow_forward_ios)',
      color: Colors.black,
      brand: 'Nike',
      price: 30,
      image: 'assets/images/Products/Pants/Pant_H&M1_LightKhakiGreen_FirstView_Front.jpg',
    ),
    Product(
      id: 8,
      name: 'Item9',
      icon: 'Icon(Icons.arrow_forward_ios)',
      color: Colors.black,
      brand: 'Nike',
      price: 30,
      image: 'assets/images/Products/Outerwear/Outerwear_Adidas1_Black-White_FirstView_Front.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Flexible(
      child: GridView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(kDefaultPadding),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          childAspectRatio: 2/4,
          crossAxisSpacing: kDefaultPadding,
          mainAxisSpacing: 5,
        ),
        itemCount: 9,
        itemBuilder:(BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget> [
                Image.asset(product[index].image),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
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

                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: product[index].name.toUpperCase() + "\n",
                                style: Theme.of(context).textTheme.button,
                              ),
                              TextSpan(
                                text: product[index].brand.toUpperCase(),
                                style: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "\$" + product[index].price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: kPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

