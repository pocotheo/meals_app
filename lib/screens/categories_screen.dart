import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: CategoryItem(
                  title: catData.title,
                  color: catData.color,
                  id: catData.id,
                )),
          )
          .toList(),
    );
  }
}
