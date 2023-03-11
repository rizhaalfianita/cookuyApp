import 'package:cookuy/views/landing.dart';
import 'package:cookuy/views/register.dart';
import 'package:cookuy/firebase_options.dart';
import 'package:cookuy/views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
// Future<void> main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

void main() {
=======
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> 273fda3db476b357239f91a295f7bcf484d061dc
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
      home: const Landing(),
    );
  }
}
