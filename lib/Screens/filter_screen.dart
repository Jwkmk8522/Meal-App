import 'package:flutter/material.dart';
import 'package:mealapp/Widgets/custom_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Screen"),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text("This is Filter screen..."),
      ),
    );
  }
}
