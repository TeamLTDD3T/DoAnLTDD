import 'dart:ui';

class Product {
  late int id;
  late String name;
  late String icon;
  late Color color;
  late String brand;
  late double price;
  late String image;

  Product({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.brand,
    required this.price,
    required this.image,
  });
}