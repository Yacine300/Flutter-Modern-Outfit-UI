import 'package:flutter/material.dart';
import 'package:four/Composant/CartNavBar.dart';
import 'package:four/Composant/DefaultAppbar.dart';

import 'package:four/Screens/Cart/component/CartBody.dart';

class Cart extends StatelessWidget {
  static String routeName = "/Cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: 'Your Cart',
      ),
      body: const CartBody(),
      bottomNavigationBar: const CartNavBar(),
    );
  }
}
