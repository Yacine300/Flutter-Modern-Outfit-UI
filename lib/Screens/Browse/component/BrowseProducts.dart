import 'package:flutter/cupertino.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';
import 'package:provider/provider.dart';

import 'BrowseBody.dart';
import 'OneItem.dart';

class BrowseProducts extends StatelessWidget {
  const BrowseProducts();
  @override
  Widget build(BuildContext context) {
    List _dummyProduct = Provider.of<Products>(context).items;
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: _dummyProduct.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (SizeConfiguration.defaultSize /
            SizeConfiguration.defaultSize /
            1.8),
        mainAxisSpacing: SizeConfiguration.defaultSize / 3,
        crossAxisSpacing: SizeConfiguration.defaultSize / 3,
      ),
      itemBuilder: (context, index) => OneItem(
        id: _dummyProduct[index].id,
        image: _dummyProduct[index].image.first,
        mark: _dummyProduct[index].mark,
        subTitle: _dummyProduct[index].subTitle,
        price: _dummyProduct[index].price,
        isLicked: _dummyProduct[index].isLicked,
      ),
    );
  }
}
