import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipesByIngre.dart';
import 'package:cookuy/views/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/recipes.dart';

Widget RecipeCard(Meals2 meals, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(idmeals: meals.idMeal as String),
          ));
    },
    child: Material(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Container(
            height: 112,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(meals.strMealThumb as String),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      child: Center(
                        child: Text(
                          meals.strMeal as String,
                          style: const TextStyle(
                              color: semiBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget ButtonCustom(
    BuildContext context, String text, double width, VoidCallback action) {
  return Container(
    width: width,
    height: 58,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        spreadRadius: 4,
        blurRadius: 15,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ]),
    child: ElevatedButton(
      onPressed: action,
      child: Text(
        text,
        style:
            TextStyle(fontWeight: FontWeight.w600, color: white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
          primary: lightOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    ),
  );
}

Widget TextFieldModel(
    BuildContext context, TextEditingController controller, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: extraLightGrey),
          borderRadius: BorderRadius.circular(30.0),
        ),
        fillColor: extraLightGrey,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: extraLightGrey, width: 3)),
        hintText: text,
        hintStyle: const TextStyle(color: lightGrey, fontSize: 12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    ),
  );
}

Widget OptionBox(double widthScreen, String icon, String text) {
  return Material(
    elevation: 1,
    borderRadius: BorderRadius.circular(5),
    color: white,
    child: Container(
      height: 122,
      width: (widthScreen - 72) / 2,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 32,
            width: 32,
            color: lightOrange,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
                fontSize: 14, color: semiBlack, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}

Widget TopSearch(BuildContext context, VoidCallback movesearch) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    child: TextFormField(
      onTap: movesearch,
      decoration: InputDecoration(
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: white),
          borderRadius: BorderRadius.circular(30.0),
        ),
        fillColor: white,
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: white, width: 3)),
        hintText: 'What do you want to eat?',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 30, right: 10),
          child: const Icon(
            Icons.search,
            color: lightGrey,
            size: 20,
          ),
        ),
        hintStyle: const TextStyle(color: lightGrey, fontSize: 14),
      ),
    ),
  );
}

Widget BookmarkCard(Meals meals, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(idmeals: meals.idMeal as String),
          ));
    },
    child: Material(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            height: 112,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(meals.strMealThumb as String),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      child: Center(
                        child: Text(
                          meals.strMeal as String,
                          style: const TextStyle(
                              color: semiBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
