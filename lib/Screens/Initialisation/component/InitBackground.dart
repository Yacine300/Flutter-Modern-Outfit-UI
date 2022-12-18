import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Screens/Browse/Browse.dart';

import 'InitDummyData.dart';

class InitBackground extends StatefulWidget {
  final int currentIndex;
  InitBackground({this.currentIndex});

  @override
  State<InitBackground> createState() =>
      _InitBackgroundState(currentIndex: currentIndex);
}

class _InitBackgroundState extends State<InitBackground> {
  int currentIndex;
  _InitBackgroundState({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfiguration.screenheight,
        width: SizeConfiguration.screenwidth,
        child: PageView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) => Image.asset(
            dummyData[currentIndex]['image'],
            fit: BoxFit.cover,
          ),
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ));
  }
}
