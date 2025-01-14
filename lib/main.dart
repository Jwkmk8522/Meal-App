import 'package:flutter/material.dart';
import 'package:mealapp/Dummy_Data/dummy_categories.dart';
import 'package:mealapp/Models/meal.dart';
import 'package:mealapp/Screens/categories_screen.dart';
import 'package:mealapp/Screens/category_meals.dart';

import 'package:mealapp/Screens/filter_screen.dart';
import 'package:mealapp/Screens/meal_detail_screen.dart';

import 'package:mealapp/Screens/tabs.dart';

import 'package:mealapp/Themes/dark_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouriteMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourie(String mealId) {
    final existingIndex = _favouriteMeal.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (existingIndex >= 0) {
      _favouriteMeal.removeAt(existingIndex);
    } else {
      _favouriteMeal.add(dummyMeals.firstWhere((meal) {
        return meal.id == mealId;
      }));
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeal.any((meal) {
      return meal.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customDarkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Tabs(
              favouriteMeal: _favouriteMeal,
            ),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMeals.routeName: (context) =>
            CategoryMeals(filterMeal: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toogleFavourite: _toggleFavourie,
            isMealFavourite: _isMealFavourite),
        FilterScreen.routeName: (context) =>
            FilterScreen(setFilter: _setFilters, filterMeal: _filters),
      },
    );
  }
}
