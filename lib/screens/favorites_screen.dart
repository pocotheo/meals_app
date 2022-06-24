import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);
  final List<Meal> favoriteMeals;
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text('Add some meals on your favorite list'));
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: favoriteMeals[index].id,
                imageUrl: favoriteMeals[index].imageUrl,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
                duration: favoriteMeals[index].duration,
                title: favoriteMeals[index].title);
          },
          itemCount: favoriteMeals.length);
    }
  }
}
