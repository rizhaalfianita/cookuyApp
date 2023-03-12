import 'package:cookuy/recomRecipe.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/search.dart';
import 'package:cookuy/views/splash.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

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
      theme: ThemeData(fontFamily: "Poppins"),
      home: const Splash(),
    );
  }
}
