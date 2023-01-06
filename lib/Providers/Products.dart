import 'package:flutter/material.dart';
import 'package:four/models/Product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '0',
        mark: 'CHANNEL',
        price: 453,
        image: ["assets/images/Hats2.jpeg"],
        subTitle: "Hat from Channel",
        descreption:
            'orem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie neque sodales sit amet. Maecenas volutpat fermentum ligula quis rutrumssa.',
        isLicked: false),
    Product(
        id: '1',
        mark: 'CHANNEL',
        price: 299.99,
        image: ["assets/images/pub.jpeg"],
        subTitle: "Hat from Channel",
        descreption:
            'orem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie neque sodales sit amet. Maecenas volutpat fermentum ligula quis rutrumssa.',
        isLicked: false),
    Product(
        id: "5",
        mark: 'LOUIS VITON',
        price: 117,
        image: [
          "assets/images/sunglasses.jpeg",
          "assets/images/sunglasses.jpeg",
          "assets/images/sunglasses.jpeg"
        ],
        subTitle: "Sunglasses from Vuiton",
        descreption:
            'orem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie neque sodales sit amet. Maecenas volutpat fermentum ligula quis rutrumssa.',
        isLicked: false),
    Product(
        id: "2",
        mark: 'H&M',
        price: 517,
        image: [
          "assets/images/intro.jpeg",
          "assets/images/intro.jpeg",
          "assets/images/intro.jpeg"
        ],
        subTitle: "outfit from H&M",
        descreption:
            'orem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie neque sodales sit amet. Maecenas volutpat fermentum ligula quis rutrumssa.',
        isLicked: false),
    Product(
        id: "3",
        mark: 'ZARA',
        price: 80.5,
        image: [
          "assets/images/bag.jpeg",
          "assets/images/bag.jpeg",
          "assets/images/bag.jpeg"
        ],
        subTitle: "Hat from Zara",
        descreption:
            'orem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie neque sodales sit amet. Maecenas volutpat fermentum ligula quis rutrumssa.',
        isLicked: false),
    Product(
        id: "4",
        mark: 'ZARA',
        price: 54.99,
        image: [
          "assets/images/shoes.jpeg",
          "assets/images/shoes.jpeg",
          "assets/images/shoes.jpeg"
        ],
        subTitle: "Hat from Zara",
        descreption:
            'orem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie nequeorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque facilisis volutpat ipsum, in molestie neque sodales sit amet. Maecenas volutpat fermentum ligula quis rutrumssa.',
        isLicked: false),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String produitID) {
    return items.firstWhere((element) => element.id == produitID);
  }
}
