import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/login.dart';
import 'package:cookuy/views/preferences/userPreferences.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  void checkLoginStatus() async {
    String username = await getEmail();
    String password = await getPassword();

    if (username.isNotEmpty && password.isNotEmpty) {
      // User is already logged in
      // Perform necessary actions (e.g., auto-login, navigate to home screen)
      print('User is already logged in');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset("assets/images/Cookuy.png")),
          ),
          Flexible(
            flex: 4,
            child: Container(
              height: 360,
              width: double.infinity,
              child: Image.asset("assets/images/icon_chef.png"),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Text(
                  "Embrace the culinary \nspirit within you",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  "Unleash your potential in the kitchen and \nunlock a world of culinary possibilities.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ButtonCustom(
              context,
              "Get Started",
              double.infinity,
              () => checkLoginStatus()),
        ],
      ),
    ));
  }
}
