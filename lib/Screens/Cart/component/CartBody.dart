import 'package:flutter/material.dart';

import 'package:four/Composant/SizeConfiguration.dart';

import 'package:four/Screens/Cart/component/CartItem.dart';

class CartBody extends StatefulWidget {
  const CartBody();
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return const CartItems();
  }
}
