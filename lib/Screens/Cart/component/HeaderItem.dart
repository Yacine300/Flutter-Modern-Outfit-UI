import 'package:flutter/cupertino.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/models/Product.dart';

class HeaderItem extends StatelessWidget {
  final int index;
  final Product dummyOneProduct;

  HeaderItem({this.index, this.dummyOneProduct});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfiguration.defaultSize * 1.2,
      width: SizeConfiguration.defaultSize * 1.2,
      child: Image.file(
        dummyOneProduct.image.first,
        fit: BoxFit.cover,
      ),
    );
  }
}
