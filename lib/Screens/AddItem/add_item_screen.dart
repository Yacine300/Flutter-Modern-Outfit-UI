import 'package:flutter/material.dart';
import 'package:four/Composant/DefaultAppbar.dart';
import 'package:four/Screens/AddItem/component/addItemBody.dart';

class AddItem extends StatelessWidget {
  static String routeName = "/add-item";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppbar(title: "Add product"),
      body: AddItemBody(),
    );
  }
}
