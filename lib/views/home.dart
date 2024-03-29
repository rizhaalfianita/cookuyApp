import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cookuy/constants.dart';
import 'package:cookuy/controller/firestoreSevices.dart';
import 'package:cookuy/views/allRecipe.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/detail.dart';
import 'package:cookuy/views/login.dart';
import 'package:cookuy/views/resumeIngredientWithoutImage.dart';
import 'package:cookuy/views/saved.dart';
import 'package:cookuy/views/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import ui
import 'dart:ui' as ui;
import '../controller/recipesByIngreController.dart';
import '../openCameraAndMLkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [const Body(), Saved()];

  int currentIndex = 0;

  List<Widget> _listScreen = [const Home(), const Saved()];
  PageController _pageController = PageController();
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          _pageController.jumpToPage(index);
        },
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            activeColor: lightOrange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.bookmark_rounded),
            title: const Text('Bookmark'),
            activeColor: lightOrange,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List meals = [];
  bool isLoading = true;
  //get widht screen from mediaquery

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getRecipesByIngre("Rice").then((value) {
      setState(() {
        meals = value;
        isLoading = false;
        print(meals.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    print("Width: $widthScreen");
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage("assets/images/wonu.jpg"),
                          ),
                          SizedBox(width: 10),
                          Text(
                            auth() as String,
                            style: TextStyle(color: lightGrey, fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                              (route) => false);
                        },
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: lightOrange,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Unleash your inner chef with Cookuy",
                      maxLines: 2,
                      style: TextStyle(
                          color: semiBlack,
                          fontSize: 27,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TopSearch(context, () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              }),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      getIngredients(context);
                    },
                    child:
                        OptionBox(widthScreen, "assets/icons/scan.svg", "Scan"),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResumeIngredientWithoutImage(
                                      meals: [],
                                    )));
                      },
                      child: OptionBox(
                          widthScreen, "assets/icons/add.svg", "Add Manual"))
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Recommended recipe",
                    style: TextStyle(
                        color: semiBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const AllRcipe(
                                    ingredients: ["egg"],
                                  ))));
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          color: lightOrange,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              isLoading
                  ? Container()
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
