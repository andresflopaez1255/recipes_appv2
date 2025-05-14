

import 'package:recipes_appv2/domain/entities/categories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';
@riverpod
class Categories extends _$Categories {
  @override
  List<Category> build() {
    return [];
  }

  void setCategories(List<Category> categories) {
    state = categories;
  }

  void filterCategories(String category) {
    // ignore: unrelated_type_equality_checks
    state = (state).where((cat) => cat == category).toList();
  }
}