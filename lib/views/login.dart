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
  bool isPasswordVisible = true;

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
              "Login to Your Acccount",
              style: TextStyle(
                  color: semiBlack, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 18),
            TextFieldModel(
              context,
              controllerEmail,
              "Email Address",
            ),
            const SizedBox(height: 18),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(2, 4), // changes position of shadow
                ),
              ]),
              child: TextFormField(
                controller: controllerPass,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: white)),
                  fillColor: white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: white, width: 3)),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
                  suffixIcon: IconButton(
                      onPressed: (() => setState(
                          () => isPasswordVisible = !isPasswordVisible)),
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                ),
                obscureText: isPasswordVisible,
              ),
            ),
            const SizedBox(height: 20),
            ButtonCustom(
                context,
                "Sign In",
                double.infinity,
                () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()))),
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
                            builder: (context) => Register()));
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
