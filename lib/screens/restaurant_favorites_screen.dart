import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../typography.dart';
import '../providers/favorites_provider.dart';
import 'restaurant_details_screen.dart';

class RestaurantFavoritesScreen extends ConsumerWidget {
  const RestaurantFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Restaurants', style: AppTextStyles.loraRegularHeadline),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No favorite restaurants yet'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final restaurant = favorites[index];
                return ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: Text(restaurant.name ?? 'Unnamed Restaurant'),
                  subtitle: Text(
                    restaurant.categories?.map((c) => c.title).join(', ') ?? '',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailsScreen(
                          restaurantId: restaurant.id!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
} 