import '../../domain/entities/recipes.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.idMeal,
    required super.strMeal,
    super.strMealAlternate,
    required super.strCategory,
    required super.strArea,
    required super.strInstructions,
    required super.strMealThumb,
    super.strTags,
    super.strYoutube,
    required super.ingredients,
    required super.measures,
    super.strSource,
    super.strImageSource,
    super.strCreativeCommonsConfirmed,
    super.dateModified,
    super.isFavorite,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> parseList(String prefix) {
      return List.generate(
              20, (index) => json['$prefix${index + 1}'] as String?)
          .where((item) => item != null && item.isNotEmpty)
          .cast<String>()
          .toList();
    }

    return RecipeModel(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strMealAlternate: json['strMealAlternate'] as String?,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strInstructions: json['strInstructions'] as String,
      strMealThumb: json['strMealThumb'] as String,
      strTags: json['strTags'] as String?,
      strYoutube: json['strYoutube'] as String?,
      ingredients: parseList('strIngredient'),
      measures: parseList('strMeasure'),
      strSource: json['strSource'] as String?,
      strImageSource: json['strImageSource'] as String?,
      strCreativeCommonsConfirmed:
          json['strCreativeCommonsConfirmed'] as String?,
      dateModified: json['dateModified'] != null
          ? DateTime.parse(json['dateModified'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, String?> serializeList(List<String> list, String prefix) {
      final map = <String, String?>{};
      for (int i = 0; i < 20; i++) {
        map['$prefix${i + 1}'] = i < list.length ? list[i] : null;
      }
      return map;
    }

    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealAlternate': strMealAlternate,
      'strCategory': strCategory,
      'strArea': strArea,
      'strInstructions': strInstructions,
      'strMealThumb': strMealThumb,
      'strTags': strTags,
      'strYoutube': strYoutube,
      ...serializeList(ingredients, 'strIngredient'),
      ...serializeList(measures, 'strMeasure'),
      'strSource': strSource,
      'strImageSource': strImageSource,
      'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
      'dateModified': dateModified?.toIso8601String(),
    };
  }
}