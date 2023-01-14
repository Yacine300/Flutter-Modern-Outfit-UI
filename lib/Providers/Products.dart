import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four/helper/db_helper.dart';
import 'package:four/models/Product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addItem(
      {File pickedImage,
      String pickedSubTitle,
      String pickedDescreption,
      String pickedMark,
      double pickedPrice}) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        descreption: pickedDescreption,
        image: [pickedImage],
        subTitle: pickedSubTitle,
        isLicked: 0,
        mark: pickedMark,
        price: pickedPrice);

    _items.add(newProduct);
    notifyListeners();

    DBHelper.insert('produit', {
      'id': newProduct.id,
      'mark': newProduct.mark,
      'subtitle': newProduct.subTitle,
      'descreption': newProduct.descreption,
      'price': newProduct.price,
      'image': newProduct.image.first.path,
      'isLicked': newProduct.isLicked
    });
  }

  Product findById(String produitID) {
    return items.firstWhere((element) => element.id == produitID);
  }

  Future<void> fetchAnsSetsProducts() async {
    final dataList = await DBHelper.fetchData('produit');

    _items = dataList
        .map((e) => Product(
            id: e['id'],
            descreption: e['descreption'],
            image: [File(e['image'])],
            subTitle: e['subtitle'],
            price: e['price'],
            mark: e['mark'],
            isLicked: e['isLicked']))
        .toList();
    notifyListeners();
  }

  Future<void> update(
      {String id,
      String subTitle,
      String image,
      double price,
      String mark,
      String descreption,
      int isLicked}) async {
    await DBHelper.updateItem(
        id: id,
        descrption: descreption,
        image: image,
        isLicked: isLicked,
        mark: mark,
        price: price,
        title: subTitle);
    Product updatedProduct = Product(
        id: id,
        descreption: descreption,
        image: [File(image)],
        isLicked: isLicked,
        mark: mark,
        price: price,
        subTitle: subTitle);
    Product produit = findById(id);

    _items[_items.indexOf(produit)] = updatedProduct;
    notifyListeners();
  }
}
