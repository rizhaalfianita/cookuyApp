//create function to get recipes by ingredients from API

import 'dart:convert';

import 'package:cookuy/controller/firestoreSevices.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/models/recipesByIngre.dart';
import 'package:http/http.dart' as http;

Future<List<Meals2>> getRecipesByIngre(String ingre) async {
  String url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingre";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var rest = data["meals"] == null ? [] : data["meals"] as List;
    List<Meals2> meals = rest.map((e) => Meals2.fromJson(e)).toList();
    return meals;
  } else {
    throw Exception("Failed to load data");
  }
}

//create function to get recipes by category from API
Future<Meals> getDetailRecipe(String id) async {
  String url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var rest = data["meals"] as List;
    Meals meals = Meals.fromJson(rest[0]);
    return meals;
  } else {
    throw Exception("Failed to load data");
  }
}

Future<List<Meals2>> getRecipeByName(String name) async {
  String url = "https://www.themealdb.com/api/json/v1/1/search.php?s=$name";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var rest = data["meals"] == null ? [] : data["meals"] as List;
    List<Meals2> meals = rest.map((e) => Meals2.fromJson(e)).toList();
    return meals;
  } else {
    throw Exception("Failed to load data");
  }
}

//get allBookmark
Future<List<Meals>> getAllBookmark() async {
  List<Meals> allBookmark = [];
  String url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
  getBookmarks(auth()!);
  print("bookmarks : " + bookmarks.toString());
  for (var i = 0; i < bookmarks.length; i++) {
    String urlEachBookmark = url + bookmarks[i];
    print("urlEachBookmark : " + urlEachBookmark);
    var response = await http.get(Uri.parse(urlEachBookmark));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = data["meals"] as List;
      Meals meals = Meals.fromJson(rest[0]);
      allBookmark.add(meals);
    } else {
      throw Exception("Failed to load data");
    }
  }

  return allBookmark;
}
