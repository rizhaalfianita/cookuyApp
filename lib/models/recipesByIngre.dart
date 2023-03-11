// ignore: file_names
class RecipesByIngre {
  List<Meals2>? meals;

  RecipesByIngre({this.meals});

  RecipesByIngre.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meals2>[];
      json['meals'].forEach((v) {
        meals!.add(Meals2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals2 {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals2({this.strMeal, this.strMealThumb, this.idMeal});

  Meals2.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }
}
