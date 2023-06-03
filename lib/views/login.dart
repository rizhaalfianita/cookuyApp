import 'package:cookuy/constants.dart';
import 'package:cookuy/controller/firestoreSevices.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/home.dart';
import 'package:cookuy/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = true;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> saveLoginInfo(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  void initState() {
    super.initState();
  }

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
      await saveLoginInfo(emailAddress, password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
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
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image.asset("assets/images/Cookuy.png")),
              SizedBox(height: 50),
              Text(
                "Login to continue",
                style: TextStyle(
                    color: semiBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              const SizedBox(height: 15),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(color: lightOrange),
              ),
              const SizedBox(height: 36),
              TextFieldModel(
                context,
                controllerEmail,
                "Email Address",
              ),
              const SizedBox(height: 18),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: TextFormField(
                  controller: controllerPass,
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    fillColor: extraLightGrey,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide:
                            const BorderSide(color: extraLightGrey, width: 3)),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
                    suffixIcon: IconButton(
                        color: lightOrange,
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                      Navigator.pushReplacement(context,
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
