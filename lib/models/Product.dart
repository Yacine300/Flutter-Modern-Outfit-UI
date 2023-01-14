import 'dart:io';

class Product {
  final String id;
  String mark;
  String subTitle, descreption;
  double price;
  int isLicked;
  List<File> image;

  Product(
      {this.mark,
      this.subTitle,
      this.descreption,
      this.price,
      this.image,
      this.id,
      this.isLicked});
}
