// test/integration_tests/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App shows restaurant list and can navigate between tabs', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(
      const ProviderScope(
        child: RestaurantTour(),
      ),
    );

    // Verify initial state
    expect(find.text('RestauranTour'), findsOneWidget);
    expect(find.text('All Restaurants'), findsOneWidget);
    expect(find.text('My Favorites'), findsOneWidget);

    // Wait for data to load
    await tester.pump(const Duration(seconds: 2));

    // Test tab navigation
    await tester.tap(find.text('My Favorites'));
    await tester.pumpAndSettle();
    
    // Verify we're on favorites tab
    expect(find.text('No favorite restaurants yet'), findsOneWidget);

    // Go back to all restaurants
    await tester.tap(find.text('All Restaurants'));
    await tester.pumpAndSettle();
  });
}