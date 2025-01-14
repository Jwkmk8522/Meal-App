import 'package:flutter/material.dart';
import 'package:mealapp/Models/meal.dart';
import 'package:mealapp/Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Affordability offardibility;
  final int duration;
  final Complexity complexity;

  const MealItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.offardibility,
    required this.duration,
    required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";

      case Complexity.challenging:
        return "Challenging";

      case Complexity.hard:
        return "Challenging";

      default:
        return "Unknown";
    }
  }

  String get offordabilityText {
    switch (offardibility) {
      case Affordability.affordable:
        return "Affordable";

      case Affordability.luxurious:
        return "Luxurious";

      case Affordability.pricey:
        return "Pricey";

      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: {'mealId': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      splashColor: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(15),
      child: Card(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 190,
                    child: Container(
                      height: 70,
                      width: 390,
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.timer),
                                Text('$duration min'),
                                const SizedBox(
                                  width: 35,
                                ),
                                const Icon(Icons.work),
                                Text(complexityText),
                                const SizedBox(
                                  width: 35,
                                ),
                                const Icon(Icons.attach_money),
                                Text(offordabilityText),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
