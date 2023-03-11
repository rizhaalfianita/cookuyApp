import 'package:cookuy/constants.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          height: 360,
          width: double.infinity,
          decoration: BoxDecoration(
            color: lightOrange,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
          ),
          child: Image.asset("assets/images/plate circle.png"),
        ),
        SizedBox(height: defaultPadding * 2),
        Text(
          "Scan, Discover,\nand Savor",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "your personal recipe app for a \nhealthier you",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        ButtonCustom(
            context,
            "Get Started",
            150,
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Register();
            })))
      ],
    ));
  }
}
