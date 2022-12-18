import 'package:flutter/material.dart';

import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';
import 'package:four/Screens/Details/component/InfoDetailBody.dart';
import 'package:four/models/Product.dart';
import 'package:provider/provider.dart';

class DetailBody extends StatefulWidget {
  final String id;

  const DetailBody({this.id});
  @override
  State<DetailBody> createState() => _DetailBodyState(id: id);
}

class _DetailBodyState extends State<DetailBody> {
  final String id;
  _DetailBodyState({this.id});

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Product _targetProduct = Provider.of<Products>(context).findById(id);
    SizeConfiguration().init(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
                height: SizeConfiguration.screenheight * 0.6,
                width: SizeConfiguration.screenwidth,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _targetProduct.image.length,
                  itemBuilder: (context, index) => Image.asset(
                    _targetProduct.image[index],
                    fit: BoxFit.cover,
                  ),
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                )),
            Positioned(
                child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: const BackButton(
                color: Colors.black,
              ),
              title: Text(
                _targetProduct.mark,
                style: TextStyle(
                  fontFamily: 'GFSDidot',
                  color: Colors.black87,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )),
            Positioned(
              bottom: SizeConfiguration.defaultSize,
              right: SizeConfiguration.defaultSize / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_targetProduct.image.length,
                    (index) => buildDot(index: index)),
              ),
            )
          ],
        ),
        InfoDetailBody(
          targetProduct: _targetProduct,
        ),
      ],
    );
  }

  Widget buildDot({index}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _currentIndex == index ? 20 : 5,
        width: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _currentIndex == index ? Colors.white : Colors.white,
        ),
      ),
    );
  }
}
