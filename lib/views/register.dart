import 'package:cookuy/constants.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible = true;
  bool isPasswordVisibleConfirm = true;

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPass = TextEditingController();

  TextEditingController controllerConfirmPass = TextEditingController();

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
              "Create New Acccount",
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
                controller: controllerConfirmPass,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: white)),
                  fillColor: white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: white, width: 3)),
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
                  suffixIcon: IconButton(
                      onPressed: (() => setState(() =>
                          isPasswordVisibleConfirm =
                              !isPasswordVisibleConfirm)),
                      icon: isPasswordVisibleConfirm
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                ),
                obscureText: isPasswordVisibleConfirm,
              ),
            ),
            const SizedBox(height: 20),
            ButtonCustom(
                context,
                "Sign Up",
                double.infinity,
                () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()))),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: semiBlack, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    "Sign In",
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
