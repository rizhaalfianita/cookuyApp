import 'package:auto_size_text/auto_size_text.dart';
import 'package:cookuy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, John!",
                        style: TextStyle(color: lightGrey, fontSize: 16),
                      ),
                      SizedBox(
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
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/wonu.jpg"),
                  )
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),
              TopSearch(context),
              SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: borderColor, width: 1)),
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/scan.svg",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Scan",
                          style: TextStyle(
                              fontSize: 16,
                              color: semiBlack,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: borderColor, width: 1)),
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/add.svg",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Add Manual",
                          style: TextStyle(
                              fontSize: 16,
                              color: semiBlack,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended recipe",
                    style: TextStyle(
                        color: semiBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: lightOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 300,
                
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
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: extraLightGrey)),
          fillColor: extraLightGrey,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: extraLightGrey, width: 3)),
          hintText: 'What do you want to eat?',
          prefixIcon: Icon(
            Icons.search,
            color: lightGrey,
          ),
          hintStyle: TextStyle(color: lightGrey, fontSize: 16),
        ),
      ),
    );
  }
}
