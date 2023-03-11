import 'package:auto_size_text/auto_size_text.dart';
import 'package:cookuy/constants.dart';
import 'package:flutter/material.dart';

class RecomRecipe extends StatelessWidget {
  const RecomRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  child: Material(
                    color: lightOrange,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 1,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "So, here are recipe recommendations that you can try with your cooking ingredients...",
                style: TextStyle(
                  color: semiBlack,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RecipeCardLong();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container RecipeCardLong() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 120,
      width: double.infinity,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 160,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 203, 203, 203),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/fried-rice.jpg"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 150,
                    child: AutoSizeText(
                      "Fried Rice with Special Egg",
                      maxLines: 3,
                      minFontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: semiBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text("Seafood",
                      style: TextStyle(
                          color: lightGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  // SizedBox(
                  //   height: 20,
                  //   child: ListView.builder(
                  //     itemCount: 3,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         margin: const EdgeInsets.only(right: 2),
                  //         child: Material(
                  //           color: lightOrange,
                  //           borderRadius: BorderRadius.circular(5),
                  //           child: const Padding(
                  //             padding:
                  //                 EdgeInsets.only(bottom: 5, left: 7, right: 7),
                  //             child: Text(
                  //               "Onion",
                  //               style: TextStyle(color: white),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
