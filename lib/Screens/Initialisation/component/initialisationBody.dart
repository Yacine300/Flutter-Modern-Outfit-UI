import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Screens/Initialisation/component/HeaderTextBrand.dart';

import 'InitDummyData.dart';
import 'IntroTextAction.dart';

class InitBody extends StatefulWidget {
  @override
  State<InitBody> createState() => _InitBodyState();
}

class _InitBodyState extends State<InitBody> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);

    return Stack(
      children: [
        Container(
            height: SizeConfiguration.screenheight,
            width: SizeConfiguration.screenwidth,
            child: PageView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) => Image.asset(
                dummyData[_currentIndex]['image'],
                fit: BoxFit.cover,
              ),
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            )),
        HeaderTextBrand(),
        IntroTextAction(
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}
