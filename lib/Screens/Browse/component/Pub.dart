import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';

class Pub extends StatelessWidget {
  const Pub();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfiguration.screenheight * 0.25,
          width: SizeConfiguration.screenwidth * 0.88,
          child: Image.asset(
            "assets/images/sunglasses.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            right: SizeConfiguration.defaultSize / 3,
            bottom: SizeConfiguration.defaultSize / 3,
            child: Container(
              height: SizeConfiguration.defaultSize / 1.5,
              width: SizeConfiguration.defaultSize * 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey[50],
                  Colors.grey[50],
                  Colors.white.withOpacity(0.3),
                ],
                tileMode: TileMode.mirror,
              )),
              child: Padding(
                padding:
                    EdgeInsets.only(left: SizeConfiguration.defaultSize / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Women's",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GFSDidot'),
                    ),
                    Container(
                      height: 1,
                      width: 110,
                      color: Colors.black87,
                    ),
                    const Text(
                      'Jeans & Jackets',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'GFSDidot',
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
