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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: defaultPadding * 2,
                  bottom: defaultPadding * 1.5,
                  left: defaultPadding,
                  right: defaultPadding),
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
                        child: Icon(
                          Icons.arrow_back,
                          color: white,
                          size: 24,
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: white),
                        ),
                        fillColor: white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
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
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 16,
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
