import 'package:auto_size_text/auto_size_text.dart';
import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipesByIngre.dart';
import 'package:cookuy/views/detail.dart';
import 'package:flutter/material.dart';

Widget RecipeCard(Meals2 meals, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(idmeals: meals.idMeal as String),
          ));
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: defaultPadding),
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
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 203, 203, 203),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(meals.strMealThumb as String),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width -
                            defaultPadding * 7,
                        child: AutoSizeText(
                          meals.strMeal as String,
                          style: const TextStyle(
                              color: semiBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                        ),
                      ),
                      // Material(
                      //   elevation: 1,
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: extraLightOrange,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 2, horizontal: 10),
                      //     child: Row(
                      //       children: const [
                      //         Icon(
                      //           Icons.location_pin,
                      //           color: white,
                      //           size: 16,
                      //         ),
                      //         SizedBox(width: 5),
                      //         // Text(
                      //         //   meals.strArea == null
                      //         //       ? "Unknown"
                      //         //       : meals.strArea as String,
                      //         //   style: TextStyle(
                      //         //       color: white, fontWeight: FontWeight.w400),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Text(
                  //   meals.strCategory == null
                  //       ? "unknown"
                  //       : meals.strCategory as String,
                  //   style: TextStyle(
                  //       color: lightGrey,
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w500),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget ButtonCustom(BuildContext context, String text, double widht, Future nav) {
  return SizedBox(
    width: widht,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        nav;
      },
      child: Text(
        text,
        style:
            TextStyle(fontWeight: FontWeight.w600, color: white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
          primary: lightOrange,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
  );
}
