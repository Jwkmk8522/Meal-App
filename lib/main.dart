import 'package:flutter/material.dart';

import 'package:mealapp/Screens/tabs.dart';

import 'package:mealapp/Themes/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customDarkTheme,
      debugShowCheckedModeBanner: false,
      home: const Tabs(),
    );
  }
}
