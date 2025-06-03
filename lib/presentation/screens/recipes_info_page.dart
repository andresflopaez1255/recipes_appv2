import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/repositories/favorites_repository.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/presentation/providers/favorites_provider.dart';
import 'package:recipes_appv2/presentation/widgets/recipes_info/Ingredients.dart';
import 'package:recipes_appv2/presentation/widgets/recipes_info/image_recipe.dart';
import 'package:recipes_appv2/presentation/widgets/recipes_info/title_section.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
   

class RecipesInfoPage extends ConsumerWidget {
  final Recipe meal;

  const RecipesInfoPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRepository = ref.watch(favoritiesRepositoryProvider);
    final videoID = meal.strYoutube?.split('=').last;
    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoID ?? '',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    return SafeArea(
      child: YoutubePlayerScaffold(
        controller: controller,
        builder: (BuildContext context, Widget player) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ImageRecipe(
                  meal: meal,
                
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(title: 'Ingredients'),
                      IngredientsAndMeausures(meal: meal),
                      TitleSection(title: 'Instructions'),
                      Text(
                        meal.strInstructions,
                        style: const TextStyle(fontSize: 16),
                      ),
                      TitleSection(title: 'Video tutorial'),
                      YoutubePlayer(
                        controller: controller,
                        aspectRatio: 16 / 9,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
