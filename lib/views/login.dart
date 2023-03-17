import 'package:cookuy/constants.dart';
import 'package:cookuy/controller/firestoreSevices.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = true;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login(String emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print('Login success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login success'),
          backgroundColor: Colors.green,
        ),
      );
      checkUser(emailAddress);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Form(
          key: formKey,
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
                    color: semiBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    return null;
                  },
                  obscureText: isPasswordVisible,
                ),
              ),
              const SizedBox(height: 20),
              ButtonCustom(context, "Sign In", double.infinity, () {
                if (formKey.currentState!.validate()) {
                  login(controllerEmail.text, controllerPass.text);
                }
              }),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
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
      ),
    );
  }
}
