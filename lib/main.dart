import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/Products.dart';
import 'Screens/Initialisation/initialisation.dart';
import 'Composant/Route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cornucopia plus',
        theme: ThemeData(fontFamily: 'Manjari'),
        initialRoute: Initialisation.routeName,
        routes: routes,
      ),
    );
  }
}
