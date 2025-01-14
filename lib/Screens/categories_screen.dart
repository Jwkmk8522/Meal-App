import 'package:flutter/material.dart';
import 'package:mealapp/Dummy_Data/dummy_categories.dart';
import 'package:mealapp/Widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categoriesScreen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: availableCategories.map((cat) {
          return CategoryItem(title: cat.title, color: cat.color, id: cat.id);
        }).toList(),
      ),
    );
  }
}
