import 'package:cookuy/constants.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Email Address',
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
                ),
              ),
            ),
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
            const SizedBox(height: 283),
            const SizedBox(
              height: defaultPadding,
            ),
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
