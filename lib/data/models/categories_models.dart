import 'package:recipes_appv2/domain/entities/categories.dart';

class CategoriesModel extends Category {
  CategoriesModel({
    required super.idCategory,
    required super.strCategory,
    required super.strCategoryThumb,
    required super.strCategoryDescription,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      idCategory: json['idCategory'] as String,
      strCategory: json['strCategory'] as String,
      strCategoryThumb: json['strCategoryThumb'] as String,
      strCategoryDescription: json['strCategoryDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // Convert the CategoriesModel instance to a JSON map
    return {
      'idCategory': idCategory,
      'strCategory': strCategory,
      'strCategoryDescription': strCategoryDescription,
      'strCategoryThumb': strCategoryThumb,
    };
  }
}
