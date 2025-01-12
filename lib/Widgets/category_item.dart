import 'package:flutter/material.dart';
import 'package:mealapp/Screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});
  void _selectedCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryMeals(
              categoryTitle: title,
              categoryId: id,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectedCategory(context);
      },
      splashColor: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
