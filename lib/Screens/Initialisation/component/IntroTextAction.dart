import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Screens/Browse/Browse.dart';

import 'InitDummyData.dart';

class IntroTextAction extends StatelessWidget {
  final int currentIndex;

  IntroTextAction({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SizeConfiguration.screenheight / 2,
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: SizedBox(
            width: SizeConfiguration.screenwidth / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dummyData[currentIndex]['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'GFSDidot',
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(
                  height: SizeConfiguration.defaultSize / 4,
                ),
                Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Browse.routeName),
                          icon: Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 25,
                            color: Colors.white,
                          )),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      dummyData.length,
                      (index) =>
                          buildDot(index: index, currentIndex: currentIndex)),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildDot({index, currentIndex}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: SizeConfiguration.defaultSize +
              SizeConfiguration.defaultSize / 2),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 5,
        width: currentIndex == index ? 20 : 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Colors.white : Colors.white,
        ),
      ),
    );
  }
}
