import 'package:cookuy/recomRecipe.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/saved.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      home: RecomRecipe(),
    );
  }
}
