import 'package:flutter/material.dart';

import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';

import 'package:four/Screens/Browse/component/BrowseProducts.dart';
import 'package:four/Screens/Browse/component/IntroAndDate.dart';
import 'package:four/Screens/Browse/component/Pub.dart';
import 'package:provider/provider.dart';

import 'CategorieData.dart';

class BrowseBody extends StatefulWidget {
  @override
  State<BrowseBody> createState() => _BrowseBodyState();
}

class _BrowseBodyState extends State<BrowseBody> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return FutureBuilder(
        future: Provider.of<Products>(context).fetchAnsSetsProducts(),
        builder: (context, snapshot) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IntroAndDate(),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfiguration.defaultSize / 6,
                          horizontal: SizeConfiguration.defaultSize / 4),
                      child: const Pub()),
                  Container(
                    height: SizeConfiguration.defaultSize / 2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: menuCategorie.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfiguration.defaultSize / 3,
                                  top: 10,
                                  bottom: 5),
                              child: menu(index: index),
                            )),
                  ),
                  SizedBox(
                    height: SizeConfiguration.defaultSize / 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfiguration.defaultSize / 4,
                    ),
                    child: const BrowseProducts(),
                  )
                ],
              ),
            ));
  }

  Widget buildDot({index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: SizeConfiguration.defaultSize +
              SizeConfiguration.defaultSize / 2),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 5,
        width: _currentIndex == index ? 20 : 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _currentIndex == index ? Colors.white : Colors.white,
        ),
      ),
    );
  }

  Widget menu({index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            menuCategorie[index],
            style: TextStyle(
                fontWeight:
                    _currentIndex == index ? FontWeight.w800 : FontWeight.w300,
                color:
                    _currentIndex == index ? Colors.black87 : Colors.grey[400]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: _currentIndex == index
                ? Container(
                    height: 2,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black87,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
