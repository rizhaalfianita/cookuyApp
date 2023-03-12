import 'package:cookuy/recomRecipe.dart';
import 'package:cookuy/views/allRecipe.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
//import iu
import 'dart:ui' as ui;
import '../constants.dart';
import '../objectPainter.dart';

class ResumeIngredientWithoutImage extends StatefulWidget {
  List meals;
  ResumeIngredientWithoutImage({
    super.key,
    required this.meals,
  });

  @override
  State<ResumeIngredientWithoutImage> createState() => _ResumeIngredientState();
}

class _ResumeIngredientState extends State<ResumeIngredientWithoutImage> {
  late List myFocusNode = [];

  //init state
  @override
  void initState() {
    super.initState();
    myFocusNode = List.generate(widget.meals.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
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
              const SizedBox(height: 20),
              const Text(
                "Lets cook with your available ingredients",
                style: TextStyle(
                  color: semiBlack,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 50,
                //fill color rounder border
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    //icon info
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      "You can add more ingredients or remove\nsome of them",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: widget.meals.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  //list tile for each ingredient
                  return ListTile(
                    //create border just in bottom of each list tile
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    title: TextFormField(
                      initialValue: widget.meals[index],
                      focusNode: myFocusNode[index],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      // onTapOutside: (event) {
                      //   //remove focus node when tap outside
                      //   //update ingredient name
                      //   setState(() {
                      //     widget.meals[index] = myFocusNode[index]
                      //         .attachedContext!
                      //         .readState()! as String;
                      //     myFocusNode[index].unfocus();
                      //     print(widget.meals.toString());
                      //   });
                      // },
                      onChanged: (value) {
                        setState(() {
                          widget.meals[index] = value;
                          print(widget.meals.toString());
                        });
                      },
                    ),
                    trailing: //delete iconbuttoon
                        IconButton(
                      onPressed: () {
                        setState(() {
                          widget.meals.removeAt(index);
                          myFocusNode.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
              // create add button to add more ingredient with full width of screen
              const SizedBox(height: 20),
              InkWell(
                //outline border
                onTap: () {
                  //add more ingredient
                  setState(() {
                    widget.meals.add("new ingredient");
                    //add focus node to new ingredient
                    myFocusNode.add(FocusNode());
                    myFocusNode.last.requestFocus();
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: semiBlack),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Add more ingredients",
                      style: TextStyle(
                        color: semiBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ButtonCustom(
                context,
                "Next",
                double.infinity,
                () {
                  if (widget.meals.isEmpty) {
                    //show snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please add at least one ingredient"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    //go to next page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecomRecipe(
                                  ingredients: widget.meals,
                                )));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
