import 'package:flutter/material.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart'
    show
        YoutubePlayer,
        YoutubePlayerController,
        YoutubePlayerParams,
        YoutubePlayerScaffold;

class RecipesInfoPage extends StatelessWidget {
  final Recipe meal;

  const RecipesInfoPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    // Initialize the Youtube player controller with a video ID
    final videoID = meal.strYoutube?.split('=').last;
    debugPrint('Video ID: $videoID');
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
                Stack(
                  children: [
                    Container(
                      height: 330,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(meal.strMealThumb),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withAlpha(80), BlendMode.darken),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.strMeal, // Use the meal's name
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.category, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                meal.strCategory, // Use the meal's category
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (int i = 0; i < meal.ingredients.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.circle,
                                      size: 8, color: Color(0xFFFFAC70)),
                                  SizedBox(width: 8),
                                ],
                              ),
                              Text(
                                meal.ingredients[i], // Ingredient name
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                meal.measures[i], // Corresponding measure
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),

                      const SizedBox(height: 20),
                      const Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        meal.strInstructions, // Instructions
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        'Video',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Video player widget can be added here

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
