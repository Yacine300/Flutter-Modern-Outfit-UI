import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';

class Color extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Row(
      children: [
        Text("Color:"),
        Container(
          height: SizeConfiguration.defaultSize / 5,
          width: SizeConfiguration.defaultSize / 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black87),
        )
      ],
    );
  }
}
