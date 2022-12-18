import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';

class InfoDetailBody extends StatelessWidget {
  final targetProduct;

  InfoDetailBody({this.targetProduct});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfiguration.screenheight * 0.4,
        width: SizeConfiguration.screenwidth,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    targetProduct.mark,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        targetProduct.subTitle,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const Spacer(),
                      Text(
                        "\$${targetProduct.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            fontFamily: 'GFSDidot'),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                targetProduct.descreption,
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                width: SizeConfiguration.screenwidth,
                height: SizeConfiguration.defaultSize / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black87,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
