import 'package:flutter/material.dart';
import 'package:mealapp/Screens/categories_screen.dart';
import 'package:mealapp/Screens/favourite_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  final List<Map<String, Object>> _pages = [
    {'page': const CategoriesScreen(), 'title': 'Meals'},
    {'page': const FavouriteScreen(), 'title': 'Favourite Meals'},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedIndex]['title'] as String),
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onError,
          // type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Meal",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourite",
            ),
          ]),
    );
  }
}
