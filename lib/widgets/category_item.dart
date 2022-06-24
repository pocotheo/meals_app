// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {required this.title, required this.color, required this.id});

  void selectCategory(BuildContext ctx, String title, String id) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context, title, id),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 8,
                  offset: const Offset(-2, 5))
            ],
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
