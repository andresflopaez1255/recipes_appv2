import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/main.dart';

void main() {
  testWidgets('should navigate to recipe details page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Simulate navigation to the recipe details page
    final router = GoRouter.of(tester.element(find.byType(MyApp)));
    router.push('/recipe', extra: {
      'strMeal': 'Test Meal',
      'strMealThumb': 'https://example.com/image.jpg',
    });

    await tester.pumpAndSettle();

    // Verify the recipe details page is displayed
    expect(find.text('Test Meal'), findsOneWidget);
  });
}
