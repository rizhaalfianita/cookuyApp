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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Material(
                  color: lightOrange,
                  borderRadius: BorderRadius.circular(50),
                  elevation: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: white,
                      size: 28,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
