import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routesArg =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routesArg['title']!;
      final categoryId = routesArg['id'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadedInitData = true;

    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                  id: displayedMeal[index].id,
                  imageUrl: displayedMeal[index].imageUrl,
                  affordability: displayedMeal[index].affordability,
                  complexity: displayedMeal[index].complexity,
                  duration: displayedMeal[index].duration,
                  title: displayedMeal[index].title);
            },
            itemCount: displayedMeal.length));
  }
}
