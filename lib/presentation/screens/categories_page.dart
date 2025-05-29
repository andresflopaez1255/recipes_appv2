import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/data/repositories/categories_repository_impl/categories_repository_impl.dart';
import 'package:recipes_appv2/presentation/providers/categories_providers/categories_provider.dart';
import 'package:recipes_appv2/presentation/providers/navigation_providers/navigation_provider.dart';
import 'package:recipes_appv2/presentation/widgets/categories/search_bar.dart';
import 'package:recipes_appv2/presentation/widgets/commons/appBarCustom.dart';
import 'package:recipes_appv2/presentation/widgets/skeletons/categories/skeleton_categories.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  late final CategoriesRepositoryImpl categoriesRepository;
  @override
  void initState() {
    categoriesRepository = ref.read(categoriesRepositoryProvider);
    super.initState();
    _fetchCategories();
  }

  void _fetchCategories() async {
    await categoriesRepository.fetchCategories(ref);
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: Appbarcustom(
        title: 'Categories',
        isBackButtonVisible: true,
        isTitleVisible: true,
       
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SearchBarCustom(
              onSearch: (value) {
                categoriesRepository.searchCategories(value, ref);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                future: Future.wait(categories.map((category) async {
                  final countRecipesByCategory = await categoriesRepository
                      .findRecipesByCategory(category.strCategory, ref);

                  return {
                    'category': category,
                    'count': countRecipesByCategory.length,
                  };
                }).toList()),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SkeletonCategories(),
                    );
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: Text('Error loading categories'),
                    );
                  }
                  final data = snapshot.data as List<Map<String, dynamic>>;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, index) {
                      final category = data[index]['category'];
                      final count = data[index]['count'];

                      return CategoriesItem(category: category, count: count);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.category,
    required this.count,
  });

  final dynamic category;
  final dynamic count;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                category.strCategoryThumb,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    category.strCategory,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    '$count recipes',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffF95F5F),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
