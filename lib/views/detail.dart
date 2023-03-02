import 'package:cookuy/constants.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FloatingActionButton(
        hoverElevation: 10,
        splashColor: lightGrey,
        backgroundColor: lightOrange,
        tooltip: 'Save',
        elevation: 4,
        child: Icon(Icons.bookmark_outline),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/fried-rice.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: 20),
                  child: Material(
                    color: lightOrange,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: lightGrey,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Indonesia",
                            style: TextStyle(color: lightGrey, fontSize: 17),
                          ),
                        ],
                      ),
                      Material(
                        color: lightOrange,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            "Seafood",
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Fried Rice",
                    style: TextStyle(
                      color: semiBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      color: semiBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  ListView.builder(
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: lightOrange,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Rice " + "1 bowl",
                              style: TextStyle(
                                color: semiBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Instructions",
                    style: TextStyle(
                      color: semiBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "1. Cook rice and let it cool in the fridge overnight.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: semiBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
