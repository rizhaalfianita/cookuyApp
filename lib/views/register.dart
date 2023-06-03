import 'package:cookuy/constants.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register(String emailAddress, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print('Register success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Register success'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
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
                "Create your first \naccount",
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
              const SizedBox(height: 18),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: TextFormField(
                  controller: controllerConfirmPass,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    filled: true,
                    fillColor: extraLightGrey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide:
                            const BorderSide(color: extraLightGrey, width: 3)),
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
                    suffixIcon: IconButton(
                        color: lightOrange,
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        onPressed: (() => setState(() =>
                            isPasswordVisibleConfirm =
                                !isPasswordVisibleConfirm)),
                        icon: isPasswordVisibleConfirm
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    return null;
                  },
                  obscureText: isPasswordVisibleConfirm,
                ),
              ),
              const SizedBox(height: 20),
              ButtonCustom(context, "Sign Up", double.infinity, () {
                if (formKey.currentState!.validate()) {
                  if (controllerConfirmPass.text == controllerPass.text) {
                    register(controllerEmail.text, controllerPass.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password doesn't match"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }),
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
                      Navigator.pushReplacement(context,
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
      ),
    );
  }
}
