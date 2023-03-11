import 'package:cookuy/constants.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 95),
            Center(
              child: Text(
                "Cookuy",
                style: TextStyle(
                    color: lightOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
            ),
            const SizedBox(height: 42),
            const Text(
              "Login to your Acccount",
              style: TextStyle(
                  color: semiBlack, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 18),
            TextFieldModel(
              context,
              controllerEmail,
              "Email Address"
            ),
            const SizedBox(height: 18),
            TextFieldModel(context, controllerPass, "Password"),
            const SizedBox(height: 20),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: lightOrange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: semiBlack, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: lightOrange, fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
