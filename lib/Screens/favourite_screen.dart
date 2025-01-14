import 'package:flutter/material.dart';
import 'package:mealapp/Models/meal.dart';
import 'package:mealapp/Widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favouriteScreen';
  final List<Meal> favouriteMeal;
  const FavouriteScreen({super.key, required this.favouriteMeal});

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return const Center(
        child: Text("There is no favourite item to show  ..."),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            offardibility: favouriteMeal[index].affordability,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
          );
        },
      );
    }
  }
}
