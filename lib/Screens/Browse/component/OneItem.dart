import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Screens/Details/Detail.dart';

class OneItem extends StatefulWidget {
  final String id, image, mark, subTitle;
  final double price;
  final bool isLicked;

  const OneItem(
      {this.id,
      this.image,
      this.mark,
      this.price,
      this.subTitle,
      this.isLicked});
  @override
  State<OneItem> createState() => _OneItemState(
      id: id,
      image: image,
      isLicked: isLicked,
      mark: mark,
      price: price,
      subTitle: subTitle);
}

class _OneItemState extends State<OneItem> {
  final String id, image, mark, subTitle;
  final double price;
  bool isLicked;

  _OneItemState(
      {this.id,
      this.image,
      this.mark,
      this.price,
      this.subTitle,
      this.isLicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      id: id,
                    )));
      },
      child: Container(
          //height: SizeConfiguration.defaultSize * 3,          //  grid deledgate in gridView.duilder
          //width: SizeConfiguration.defaultSize * 2.5,
          color: Colors.red,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                  child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mark,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 10),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ ' + price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'GFSDidot'),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => setState(() {
                              isLicked = !isLicked;
                            }),
                            child: Container(
                              height: SizeConfiguration.defaultSize / 4,
                              width: SizeConfiguration.defaultSize / 4,
                              child: isLicked
                                  ? SvgPicture.asset(
                                      "assets/icons/galb_plein.svg",
                                      fit: BoxFit.cover,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/galb.svg",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
