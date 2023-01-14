import 'package:flutter/material.dart';
import 'package:four/Screens/AddItem/add_item_screen.dart';
import 'package:four/Screens/Browse/Browse.dart';
import 'package:four/Screens/Cart/Cart.dart';
import 'package:four/Screens/Details/Detail.dart';
import 'package:four/Screens/Initialisation/initialisation.dart';
import 'package:four/Screens/UpdateItem/update_item_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Initialisation.routeName: (context) => Initialisation(),
  Browse.routeName: (context) => Browse(),
  Detail.routeName: (context) => Detail(),
  Cart.routeName: (context) => Cart(),
  AddItem.routeName: (context) => AddItem(),
  UpdateItemScreen.routeName: (context) => UpdateItemScreen(),
};
