import 'package:flutter/material.dart';

import 'package:mealapp/Models/meal.dart';

import 'package:mealapp/Widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/categoryMealScreen';
  final List<Meal> filterMeal;
  const CategoryMeals({super.key, required this.filterMeal});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['categoryTitle']!;

    final categoryId = routeArgs['categoryId'];

    final displayMeal = filterMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeal[index].id,
            imageUrl: displayMeal[index].imageUrl,
            title: displayMeal[index].title,
            offardibility: displayMeal[index].affordability,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
          );
        },
      ),
    );
  }
}
