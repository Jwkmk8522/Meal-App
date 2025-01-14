import 'package:flutter/material.dart';
import 'package:mealapp/Dummy_Data/dummy_categories.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/mealDetailScreen';
  final Function toogleFavourite;
  final Function isMealFavourite;
  const MealDetailScreen(
      {super.key,
      required this.toogleFavourite,
      required this.isMealFavourite});
  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget titleDetail(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['mealId'];
    final selectedMeal = dummyMeals.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(selectedMeal.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const Text("connect internet");
                },
                fit: BoxFit.cover,
              ),
            ),
            titleDetail(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  border:
                      Border.all(color: Theme.of(context).colorScheme.onError),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 250,
              width: 200,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            titleDetail(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  border:
                      Border.all(color: Theme.of(context).colorScheme.onError),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 250,
              width: 300,
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.steps[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            widget.isMealFavourite(mealId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () {
            setState(() {
              widget.toogleFavourite(mealId);
            });
          }),
    );
  }
}
