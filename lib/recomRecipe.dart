import 'package:auto_size_text/auto_size_text.dart';
import 'package:cookuy/constants.dart';
import 'package:cookuy/controller/recipesByIngreController.dart';
import 'package:cookuy/models/recipesByIngre.dart';
import 'package:cookuy/views/detail.dart';
import 'package:flutter/material.dart';

class RecomRecipe extends StatefulWidget {
  final List ingredients;
  const RecomRecipe({super.key, required this.ingredients});

  @override
  State<RecomRecipe> createState() => _RecomRecipeState();
}

class _RecomRecipeState extends State<RecomRecipe> {
  List<Meals2> meals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getRecipesByIngre(widget.ingredients[0]).then((value) {
      setState(() {
        meals = value;
        isLoading = false;
        print(meals.toString());
      });
    });
  }

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
                onTap: () {
                  Navigator.pop(context);
                },
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
              meals.isEmpty
                  ? Wrap(children: [
                      Text(
                        "Sorry, we can't find any recipe with ",
                        style: TextStyle(
                          color: semiBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${widget.ingredients[0]}",
                        style: TextStyle(
                          color: lightOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " ingredient",
                        style: TextStyle(
                          color: semiBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ])
                  : Text(
                      "So, here are recipe recommendations that you can try with your cooking ingredients...",
                      style: TextStyle(
                        color: semiBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(child: const CircularProgressIndicator(color: lightOrange,)),
                    )
                  : ListView.builder(
                      itemCount: meals.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(
                                      idmeals: meals[index].idMeal!,
                                    ),
                                  ));
                            },
                            child: RecipeCardLong(meals[index], context));
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Container RecipeCardLong(Meals2 meals, context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 110,
      width: double.infinity,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 203, 203, 203),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2)),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(meals.strMealThumb as String),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: AutoSizeText(
                      meals.strMeal as String,
                      style: const TextStyle(
                          color: semiBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 2),
                  const Text("Seafood",
                      style: TextStyle(
                          color: lightGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
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
