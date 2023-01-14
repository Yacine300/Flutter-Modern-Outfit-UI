import 'package:flutter/material.dart';
import 'package:four/Composant/DefaultAppbar.dart';
import 'package:four/Screens/UpdateItem/component/update_item_screen_body.dart';

class UpdateItemScreen extends StatelessWidget {
  final String id;
  static const routeName = "update-screen";
  UpdateItemScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppbar(title: "update item"),
      body: UpdateBody(
        id: id,
      ),
    );
  }
}
