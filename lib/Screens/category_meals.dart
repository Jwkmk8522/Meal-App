import 'package:flutter/material.dart';
import 'package:mealapp/Dummy_Data/dummy_categories.dart';
import 'package:mealapp/Widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  final String categoryTitle;
  final String categoryId;
  CategoryMeals(
      {super.key, required this.categoryTitle, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final filterMeal = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: filterMeal.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: filterMeal[index].id,
              imageUrl: filterMeal[index].imageUrl,
              title: filterMeal[index].title,
              offardibility: filterMeal[index].affordability,
              duration: filterMeal[index].duration,
              complexity: filterMeal[index].complexity,
            );
          },
        ));
  }
}
