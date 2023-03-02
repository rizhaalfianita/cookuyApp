import 'package:cookuy/constants.dart';
import 'package:cookuy/views/components/customWidget.dart';
import 'package:flutter/material.dart';

class AllRcipe extends StatelessWidget {
  const AllRcipe({super.key});

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
              Text("All Recipes",
                  style: TextStyle(
                      color: semiBlack,
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return RecipeCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}