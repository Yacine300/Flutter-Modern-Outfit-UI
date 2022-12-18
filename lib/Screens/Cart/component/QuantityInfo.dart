import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityInfo extends StatelessWidget {
  const QuantityInfo();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
          child: Center(
            child: Text('+'),
          ),
        ),
        Text("  01  "),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
          child: Center(
            child: Text('-'),
          ),
        )
      ],
    );
  }
}
