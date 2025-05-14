import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/presentation/screens/search_page.dart';

void main() {
  testWidgets('should display search results when typing', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: SearchPage(),
        ),
      ),
    );

    // Verify the search bar is displayed
    expect(find.byType(TextField), findsOneWidget);

    // Simulate typing in the search bar
    await tester.enterText(find.byType(TextField), 'Chicken');
    await tester.pumpAndSettle();

    // Verify search results are displayed
    expect(find.byType(ListTile), findsWidgets);
  });
}
