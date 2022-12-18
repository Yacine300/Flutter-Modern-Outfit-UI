import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';

import 'package:four/Screens/Initialisation/component/HeaderTextBrand.dart';

import 'InitBackground.dart';
import 'IntroTextAction.dart';

class InitBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    int _currentIndex = 0;
    return Stack(
      children: [
        InitBackground(
          currentIndex: _currentIndex,
        ),
        HeaderTextBrand(),
        IntroTextAction(
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}
