import 'package:flutter/material.dart';
import 'package:mealapp/Screens/filter_screen.dart';
import 'package:mealapp/Screens/tabs.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  Widget builderListTile(
    BuildContext context,
    String title,
    IconData icon,
    Function handler,
  ) {
    return ListTile(
      leading: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(
        icon,
        size: 26,
      ),
      onTap: () {
        handler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              "Delecious Meals !",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 20),
          builderListTile(context, "Meals", Icons.no_meals, () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Tabs()));
          }),
          const Divider(),
          builderListTile(context, "Filter Meals", Icons.filter, () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const FilterScreen()));
          })
        ],
      ),
    );
  }
}
