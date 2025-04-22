import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../typography.dart';
import '../providers/restaurant_provider.dart';
import '../providers/favorites_provider.dart';

class RestaurantDetailsScreen extends ConsumerWidget {
  final String restaurantId;
  
  const RestaurantDetailsScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantAsync = ref.watch(restaurantProvider(restaurantId));
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details', style: AppTextStyles.loraRegularHeadline),
        actions: [
          if (restaurantAsync.value != null && restaurantAsync.value!.restaurants != null && restaurantAsync.value!.restaurants!.isNotEmpty)
            IconButton(
              icon: Icon(
                favorites.any((r) => r.id == restaurantAsync.value!.restaurants!.first.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favorites.any((r) => r.id == restaurantAsync.value!.restaurants!.first.id)
                    ? Colors.red
                    : null,
              ),
              onPressed: () {
                if (restaurantAsync.value != null && 
                    restaurantAsync.value!.restaurants != null && 
                    restaurantAsync.value!.restaurants!.isNotEmpty) {
                  ref.read(favoritesProvider.notifier).toggleFavorite(
                    restaurantAsync.value!.restaurants!.first,
                  );
                }
              },
            ),
        ],
      ),
      body: restaurantAsync.when(
        loading: () => const Center(child: CircularProgressIndicator( color: Colors.black)),
        error: (error, stack) => Center(
          child: Text('Error: $error', style: AppTextStyles.openRegularText),
        ),
        data: (result) {
          if (result == null || result.restaurants == null || result.restaurants!.isEmpty) {
            return const Center(
              child: Text('Restaurant not found'),
            );
          }

          final restaurant = result.restaurants!.first;
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Add restaurant image
                Container(
                  height: 200,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name ?? 'Unnamed Restaurant', 
                          style: AppTextStyles.loraRegularHeadline),
                      const SizedBox(height: 8),
                      Text(restaurant.categories?.map((c) => c.title).join(', ') ?? '',
                          style: AppTextStyles.openRegularText),
                      const SizedBox(height: 16),
                      Text('Address', style: AppTextStyles.loraRegularTitle),
                      const SizedBox(height: 8),
                      Text(restaurant.location?.formattedAddress ?? 'No address available',
                          style: AppTextStyles.openRegularText),
                      const SizedBox(height: 16),
                      Text('Rating', style: AppTextStyles.loraRegularTitle),
                      const SizedBox(height: 8),
                      Text('${restaurant.rating ?? 0} stars',
                          style: AppTextStyles.openRegularText),
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