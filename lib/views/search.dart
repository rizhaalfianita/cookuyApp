import 'package:cookuy/constants.dart';
import 'package:cookuy/controller/recipesByIngreController.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/detail.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List meals = [];
  bool isLoading = true;
  //get widht screen from mediaquery

  // @override
  // void initState() {
  //   super.initState();
  //   isLoading = true;
  //   getRecipesByIngre("Rice").then((value) {
  //     setState(() {
  //       meals = value;
  //       isLoading = false;
  //       print(meals.toString());
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding * 1.5),
              decoration: BoxDecoration(
                color: lightOrange,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Material(
                            color: white,
                            borderRadius: BorderRadius.circular(50),
                            elevation: 1,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: lightOrange,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Search",
                        style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 54,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(2, 4), // changes position of shadow
                      ),
                    ]),
                    child: TextFormField(
                      onChanged: (text) {
                        text = text.toLowerCase();
                        getRecipeByName(text).then((value) {
                          setState(() {
                            meals = value;
                            isLoading = false;
                            print(meals.toString());
                          });
                        });
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: white),
                        ),
                        fillColor: white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: white, width: 3)),
                        hintText: 'What do you want to eat?',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: lightGrey,
                          size: 20,
                        ),
                        hintStyle: const TextStyle(
                            color: lightGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  bottom: defaultPadding),
              child: isLoading
                  ? Container()
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: meals.length,
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
                    ),
            )
          ],
        ),
      ),
    );
  }
}
