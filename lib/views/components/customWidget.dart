import 'package:cookuy/constants.dart';
import 'package:flutter/material.dart';

Widget RecipeCard() {
  return Container(
    margin: EdgeInsets.only(bottom: defaultPadding),
    height: 300,
    width: double.infinity,
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 203, 203, 203),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2)),
                ],
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/images/fried-rice.jpg"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fried Rice",
                      style: TextStyle(
                          color: semiBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      color: extraLightOrange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: white,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Indonesia",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "Special fried rice with egg",
                  style: TextStyle(
                      color: lightGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
