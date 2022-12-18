class Product {
  final String id;
  final String mark;
  final String subTitle, descreption;
  final double price;
  final bool isLicked;
  final List<String> image;

  Product(
      {this.mark,
      this.subTitle,
      this.descreption,
      this.price,
      this.image,
      this.id,
      this.isLicked});
}
