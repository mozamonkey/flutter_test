// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_tour/main.dart';
import 'package:restaurant_tour/providers/restaurant_provider.dart';
import 'package:restaurant_tour/providers/favorites_provider.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Page loads with correct initial UI elements', (WidgetTester tester) async {
    final prefs = await SharedPreferences.getInstance();
    
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        restaurantsProvider.overrideWith((ref) => 
          Future.value(RestaurantQueryResult(restaurants: []))
        ),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: RestaurantTour(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('RestauranTour'), findsOneWidget);
    expect(find.text('All Restaurants'), findsOneWidget);
    expect(find.text('My Favorites'), findsOneWidget);

    container.dispose();
  });

  testWidgets('Can switch between tabs', (WidgetTester tester) async {
    final prefs = await SharedPreferences.getInstance();
    
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        restaurantsProvider.overrideWith((ref) => 
          Future.value(const RestaurantQueryResult(restaurants: []))
        ),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: RestaurantTour(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('My Favorites'));
    await tester.pumpAndSettle();

    expect(find.text('No favorite restaurants yet'), findsOneWidget);

    await tester.tap(find.text('All Restaurants'));
    await tester.pumpAndSettle();

    container.dispose();
  });
}