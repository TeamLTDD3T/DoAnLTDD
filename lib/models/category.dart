import 'dart:ui';

class Category {
  late int id;
  late String name;
  late String icon;
  late Color color;
  late String image;
  late List<Category> subCategories;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.image,
    required this.subCategories,
  });
}
