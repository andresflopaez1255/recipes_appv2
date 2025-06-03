import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/data/repositories/favorites_repository.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/presentation/widgets/commons/appBarCustom.dart';
import 'package:recipes_appv2/presentation/providers/favorites_provider.dart';

class FavoritiesPage extends ConsumerStatefulWidget {
  const FavoritiesPage({super.key});

  @override
  ConsumerState<FavoritiesPage> createState() => _FavoritiesPageState();
}

class _FavoritiesPageState extends ConsumerState<FavoritiesPage> {
  @override
  void initState() {
    super.initState();
    // Carga los favoritos al iniciar el widget
    Future.microtask(() async {
      final favoritiesRepository = ref.read(favoritiesRepositoryProvider);
      favoritiesRepository.getFavorites(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesProvider);
    return Scaffold(
      appBar: Appbarcustom(
        title: 'Favorities',
        isBackButtonVisible: true,
        isTitleVisible: true,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : FavoritiesItem(favorites: favorites, ref: ref),
    );
  }
}

class FavoritiesItem extends StatelessWidget {
  const FavoritiesItem({
    super.key,
    required this.favorites,
    required this.ref,
  });

  final List<Recipe> favorites;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          onTap: () {
            context.push(
              '/recipe',
              extra: favorites[index],
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  favorites[index].strMealThumb,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    favorites[index].strMeal,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  ref
                      .read(favoritiesRepositoryProvider)
                      .removeFavorite(favorites[index].idMeal, ref);
                },
                child: Container(
                  height: 84,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xffF95F5F),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
