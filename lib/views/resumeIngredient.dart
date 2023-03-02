import 'package:flutter/material.dart';

import '../constants.dart';

class ResumeIngredient extends StatefulWidget {
  final List meals;
  const ResumeIngredient({super.key, required this.meals});

  @override
  State<ResumeIngredient> createState() => _ResumeIngredientState();
}

class _ResumeIngredientState extends State<ResumeIngredient> {
  late List myFocusNode = [];

  //init state
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
                onTap: () {},
                child: SizedBox(
                  width: 160,
                  child: Material(
                    elevation: 1,
                    color: lightOrange,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Icon(Icons.keyboard_arrow_left, color: white),
                          SizedBox(width: 3),
                          Text(
                            "Back to Scan",
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Lets cook with your available ingredients",
                style: TextStyle(
                  color: semiBlack,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 50,
                //fill color rounder border
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    //icon info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      "You can add more ingredients or remove some of them",
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
                physics: NeverScrollableScrollPhysics(),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onTapOutside: (event) {
                        //remove focus node when tap outside
                        //update ingredient name
                        setState(() {
                          widget.meals[index] = myFocusNode[index]
                              .attachedContext!
                              .readState()! as String;
                          myFocusNode[index].unfocus();
                        });
                      },
                      // onChanged: (value) {
                      //   setState(() {
                      //     widget.meals[index] = value;
                      //   });
                      // },
                    ),
                    trailing: //delete iconbuttoon
                        IconButton(
                      onPressed: () {
                        setState(() {
                          widget.meals.removeAt(index);
                          myFocusNode.removeAt(index);
                        });
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
              // create add button to add more ingredient with full width of screen
              SizedBox(height: 20),
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
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Add more ingredients",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              InkWell(
                //outline border
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  //fill color rounder border
                  decoration: BoxDecoration(
                    color: lightOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}