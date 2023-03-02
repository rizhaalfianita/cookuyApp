import 'package:cookuy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 130,
            )),
            SizedBox(height: 20),
            Text(
              "Sign In",
              style: TextStyle(
                  color: semiBlack, fontWeight: FontWeight.w800, fontSize: 30),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Username',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: lightGrey,
                  ),
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.key,
                    color: lightGrey,
                  ),
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
