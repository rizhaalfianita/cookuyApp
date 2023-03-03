import 'package:auto_size_text/auto_size_text.dart';
import 'package:cookuy/constants.dart';
import 'package:cookuy/views/allRecipe.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:cookuy/views/detail.dart';
import 'package:cookuy/views/resumeIngredient.dart';
import 'package:cookuy/views/scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/recipesByIngreController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [const Body(), const Scan(), const Scan()];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  //get image from camera and process object detection with google ML kit
  //get ingredients from image and pass to allRecipe page
  void getIngredients() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      const mode = DetectionMode.single;
      final options = LocalObjectDetectorOptions(
          mode: mode,
          classifyObjects: false,
          multipleObjects: true,
          modelPath: "assets/ml/IngredientDetector_best-fp16.tflite");
      final objectDetector = ObjectDetector(options: options);

      final List<DetectedObject> objects = await objectDetector
          .processImage(InputImage.fromFilePath(pickedFile.path));

      for (DetectedObject detectedObject in objects) {
        final rect = detectedObject.boundingBox;
        final trackingId = detectedObject.trackingId;

        for (Label label in detectedObject.labels) {
          print('${label.text} ${label.confidence}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 60,
          child: Container(
            decoration: const BoxDecoration(
                color: white,
                border:
                    Border(top: BorderSide(color: extraLightGrey, width: 0.5))),
            child: BottomNavigationBar(
              onTap: onTap,
              currentIndex: currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 24,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon: null, icon: Icon(null), label: 'Scan'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border_outlined, size: 24),
                    label: 'Feed'),
              ],
              selectedItemColor: lightOrange,
              unselectedItemColor: lightGrey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: lightGrey,
          backgroundColor: lightOrange,
          tooltip: 'Scan',
          elevation: 4,
          child: const Icon(Icons.photo_camera),
          onPressed: () => setState(() {
            currentIndex = 1;
            getIngredients();
          }),
        ),
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Hello, John!",
                        style: TextStyle(color: lightGrey, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 300,
                        child: AutoSizeText(
                          "Unleash your inner chef with Cookuy",
                          maxLines: 2,
                          minFontSize: 24,
                          style: TextStyle(
                              color: semiBlack,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/images/wonu.jpg"),
                  )
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              TopSearch(context),
              const SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: borderColor, width: 1)),
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/scan.svg",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Scan",
                          style: TextStyle(
                              fontSize: 16,
                              color: semiBlack,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResumeIngredient(
                                    meals: [],
                                  )));
                    },
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: borderColor, width: 1)),
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/add.svg",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Add Manual",
                            style: TextStyle(
                                fontSize: 16,
                                color: semiBlack,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Recommended recipe",
                    style: TextStyle(
                        color: semiBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
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
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              isLoading
                  ? Container()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
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

  Widget TopSearch(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: extraLightGrey)),
          fillColor: extraLightGrey,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: extraLightGrey, width: 3)),
          hintText: 'What do you want to eat?',
          prefixIcon: const Icon(
            Icons.search,
            color: lightGrey,
          ),
          hintStyle: const TextStyle(color: lightGrey, fontSize: 16),
        ),
      ),
    );
  }
}
