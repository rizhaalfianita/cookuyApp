import 'package:cookuy/constants.dart';
import 'package:cookuy/controller/recipesByIngreController.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Detail extends StatefulWidget {
  final String idmeals;
  const Detail({super.key, required this.idmeals});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isLoading = true;
  Meals meals = Meals();

  //init
  void initState() {
    super.initState();
    isLoading = true;
    getDetailRecipe(widget.idmeals).then((value) {
      setState(() {
        meals = value;
        isLoading = false;
        print(meals.toString());

        YoutubePlayerController _youtubecontroller = YoutubePlayerController(
          initialVideoId:
              YoutubePlayer.convertUrlToId(meals.strYoutube as String)
                  .toString(),
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: true,
          ),
        );
      });
    });
  } // BBAyRBTfsOU

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
        child: const Icon(Icons.bookmark_outline),
        onPressed: () {},
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(meals.strMealThumb as String),
                                fit: BoxFit.cover)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding),
                          child: Material(
                            color: lightOrange,
                            borderRadius: BorderRadius.circular(50),
                            elevation: 1,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: lightOrange,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  meals.strArea as String,
                                  style: const TextStyle(
                                      color: lightOrange, fontSize: 16),
                                ),
                              ],
                            ),
                            Material(
                              color: lightOrange,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding, vertical: 5),
                                child: Text(
                                  meals.strCategory as String,
                                  style: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          meals.strMeal as String,
                          style: const TextStyle(
                            color: semiBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Ingredients",
                          style: TextStyle(
                            color: semiBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        ListView.builder(
                          itemCount: meals.ingredients!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: lightOrange,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    "${meals.measures![index]} ${meals.ingredients![index]} ",
                                    style: const TextStyle(
                                      color: semiBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Instructions",
                          style: TextStyle(
                            color: semiBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          meals.strInstructions as String,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: semiBlack,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Tutorial Video",
                          style: TextStyle(
                            color: semiBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                        YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: YoutubePlayer.convertUrlToId(
                                    meals.strYoutube as String)
                                .toString(),
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: false,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                          ],
                          onReady: () {
                            AlertDialog(
                              content: Text("Video player is ready"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
