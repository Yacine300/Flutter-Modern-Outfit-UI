import 'package:flutter/material.dart';
import 'package:four/Screens/Initialisation/component/initialisationBody.dart';

import 'component/initialisationBody.dart';

class Initialisation extends StatelessWidget {
  static String routeName = "/initialisation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InitBody(),
    );
  }
}
