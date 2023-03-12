import 'package:cookuy/constants.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/detail.dart';
import 'package:flutter/material.dart';

import '../controller/recipesByIngreController.dart';

class AllRcipe extends StatefulWidget {
  final List ingredients;
  const AllRcipe({super.key, required this.ingredients});

  @override
  State<AllRcipe> createState() => _AllRcipeState();
}

class _AllRcipeState extends State<AllRcipe> {
  //init method and call API to get data

  List meals = [];
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
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                      color: lightOrange,
                      borderRadius: BorderRadius.circular(50),
                      elevation: 1,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  const Text("All Recipes",
                      style: TextStyle(
                          color: semiBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(child: const CircularProgressIndicator()),
                    )
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 24,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                            idmeals: meals[index],
                                          )));
                            },
                            child: RecipeCard(meals[index], context));
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
