import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/repositories/recipes_repository/recipes_repository_impl.dart';
import 'package:recipes_appv2/presentation/widgets/carrousel_home/carrousel_home.dart';
import 'package:recipes_appv2/presentation/widgets/recipes/recipes_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  String _currentLetter = 'a';
  late final RecipesRepositoryImpl recipesRepositoryImpl;
  @override
  void initState() {
    super.initState();
    recipesRepositoryImpl = ref.read(recipesRepositoryProvider); 
    _fetchRecipes();
    _scrollController.addListener(_onScroll);
  }

  void _fetchRecipes() async {
    await recipesRepositoryImpl.fetchRecipesByLetter(_currentLetter, ref);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_currentLetter.codeUnitAt(0) < 'z'.codeUnitAt(0)) {
        setState(() {
          _currentLetter =
              String.fromCharCode(_currentLetter.codeUnitAt(0) + 1);
        });
        _fetchRecipes();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Carousel(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: const RecipesList(),
            ),
          ],
        ),
      ),
    );
  }

 
}
