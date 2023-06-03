import 'dart:async';

import 'package:cookuy/constants.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/landing.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Landing())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: defaultPadding),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: lightOrange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Cookuy",
              style: TextStyle(
                  color: white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: defaultPadding),
            CircularProgressIndicator(
              color: white,
            ),
            Spacer(),
            Text(
              "Hackfest 2023 by 3AM",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 15, color: white),
            )
          ],
        ),
      ),
    );
  }
}
