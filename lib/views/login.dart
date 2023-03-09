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
            const SizedBox(height: 30),
            Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 130,
            )),
            const SizedBox(height: 20),
            const Text(
              "Sign In",
              style: TextStyle(
                  color: semiBlack, fontWeight: FontWeight.w800, fontSize: 30),
            ),
            const SizedBox(height: 20),
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
                  hintText: 'Email Address',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: lightGrey,
                  ),
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 15),
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
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 54,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      color: white, fontSize: 17, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: lightOrange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: extraLightGrey, width: 2))),
            ),
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
