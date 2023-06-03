import 'package:cookuy/constants.dart';
import 'package:cookuy/views/login.dart';
import 'package:cookuy/views/preferences/userPreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: semiBlack),
        ),
        centerTitle: true,
        backgroundColor: extraLightGrey,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Column(
          children: [
            Image.asset("assets/images/user.png"),
            SizedBox(height: 40),
            FutureBuilder<String>(
                future: getEmail(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    String email = snapshot.data!;
                    return CardProfile(email);
                  } else if (snapshot.hasError) {
                    return CardProfile("${snapshot.error}");
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            SizedBox(height: 35),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Preference",
                style: TextStyle(
                    color: lightOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
                onTap: () {
                  logout();
                },
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 1,
                  color: white,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: lightOrange,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Log out",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: semiBlack),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget CardProfile(String value) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 1,
      color: white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: semiBlack),
        ),
      ),
    );
  }
}
