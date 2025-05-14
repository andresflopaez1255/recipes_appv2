import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CategoriesRepository {
  fetchCategories(WidgetRef ref);
  searchCategories(String query, WidgetRef ref);
}
