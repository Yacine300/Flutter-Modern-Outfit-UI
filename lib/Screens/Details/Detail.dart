import 'package:flutter/material.dart';

import 'package:four/Composant/SizeConfiguration.dart';

import 'package:four/Screens/Details/component/DetailBody.dart';

class Detail extends StatelessWidget {
  static String routeName = "/Detail";
  final String id;

  Detail({this.id});
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      body: DetailBody(
        id: id,
      ),
    );
  }
}
