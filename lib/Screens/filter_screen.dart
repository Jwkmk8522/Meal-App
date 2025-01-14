import 'package:flutter/material.dart';

import 'package:mealapp/Widgets/custom_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';
  final Function setFilter;
  final Map<String, bool> filterMeal;
  const FilterScreen(
      {super.key, required this.setFilter, required this.filterMeal});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filterMeal['gluten']!;
    _isVegan = widget.filterMeal['vegan']!;
    _isVegetarian = widget.filterMeal['vegetarian']!;
    _isLactoseFree = widget.filterMeal['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filter Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian,
                  };
                  widget.setFilter(selectedFilters);
                },
                icon: const Icon(Icons.save)),
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Text(
                "Filter your meals ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text("Gluten Free"),
                    subtitle: const Text("Only Iclude Gluten Free Meals "),
                    value: _isGlutenFree,
                    onChanged: (value) {
                      setState(
                        () {
                          _isGlutenFree = value;
                        },
                      );
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Vegan"),
                    subtitle: const Text("Only Iclude Vegan Meals "),
                    value: _isVegan,
                    onChanged: (value) {
                      setState(
                        () {
                          _isVegan = value;
                        },
                      );
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Vegetarian"),
                    subtitle: const Text("Only Iclude Vegeterian Meals "),
                    value: _isVegetarian,
                    onChanged: (value) {
                      setState(
                        () {
                          _isVegetarian = value;
                        },
                      );
                    },
                  ),
                  SwitchListTile(
                    title: const Text("LactoseFree"),
                    subtitle: const Text("Only Iclude LactoseFree Meals "),
                    value: _isLactoseFree,
                    onChanged: (value) {
                      setState(
                        () {
                          _isLactoseFree = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
