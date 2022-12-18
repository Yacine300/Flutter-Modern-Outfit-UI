import 'package:flutter/material.dart';
import 'package:four/Screens/Browse/Browse.dart';
import 'package:four/Screens/Cart/Cart.dart';
import 'package:four/Screens/Details/Detail.dart';
import 'package:four/Screens/Initialisation/initialisation.dart';

final Map<String, WidgetBuilder> routes = {
  Initialisation.routeName: (context) => Initialisation(),
  Browse.routeName: (context) => Browse(),
  Detail.routeName: (context) => Detail(),
  Cart.routeName: (context) => Cart(),
};
