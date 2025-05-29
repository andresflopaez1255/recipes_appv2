import 'package:recipes_appv2/domain/entities/categories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@riverpod
class Categories extends _$Categories {
  List<Category> _originalState = [];

  @override
  List<Category> build() {
    return _originalState;
  }

  void setCategories(List<Category> categories) {
    state = categories;
    _originalState = categories; // Store the original state
  }

  void filterCategories(String category) {
    if (category.isEmpty) {
      state =
          _originalState; // Restore the original state if the category is empty
      return;
    }
    final filteredCategories = state
        .where((cat) => cat.strCategory.toLowerCase().contains(category))
        .toList();
    state = filteredCategories;
  }
}
