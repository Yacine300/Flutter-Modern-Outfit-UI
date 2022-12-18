import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Screens/Cart/component/SizeInfo.dart';
import 'package:four/models/Product.dart';

import 'QuantityInfo.dart';

class TileItem extends StatelessWidget {
  final int index;
  final Product dummyOneProduct;

  TileItem({this.index, this.dummyOneProduct});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfiguration.defaultSize * 1.2,
      width: SizeConfiguration.screenwidth / 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  dummyOneProduct.mark,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                Spacer(),
                Text.rich(
                  TextSpan(
                      text: '\$ ${dummyOneProduct.price} ',
                      style: TextStyle(
                          fontFamily: 'GFSDidot',
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w800)),
                ),
              ],
            ),
            Text(
              dummyOneProduct.subTitle,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const SizeInfo(), const QuantityInfo()],
            )
          ],
        ),
      ),
    );
  }
}
