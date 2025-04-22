import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/restaurant_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RestaurantTour(),
    ),
  );
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      home: const RestaurantListScreen(),
    );
  }
}
