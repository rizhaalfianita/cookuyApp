import 'package:cookuy/recomRecipe.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/saved.dart';
import 'package:flutter/material.dart';

import 'views/ResumeIngredient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List meals = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      home: ResumeIngredient(meals: meals),
    );
  }
}
