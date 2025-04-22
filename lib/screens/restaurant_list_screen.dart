import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../typography.dart';
import '../providers/restaurant_provider.dart';
import '../providers/favorites_provider.dart';
import '../models/restaurant.dart';
import 'restaurant_details_screen.dart';

class RestaurantListScreen extends ConsumerStatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  ConsumerState<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends ConsumerState<RestaurantListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantsAsync = ref.watch(restaurantsProvider);
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants', style: AppTextStyles.loraRegularHeadline),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All Restaurants'),
            Tab(text: 'My Favorites'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRestaurantList(restaurantsAsync, favorites),
          _buildFavoritesList(favorites),
        ],
      ),
    );
  }

  Widget _buildRestaurantList(AsyncValue<RestaurantQueryResult?> restaurantsAsync, List<Restaurant> favorites) {
    return restaurantsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: $error', style: AppTextStyles.openRegularText),
      ),
      data: (result) {
        if (result == null || result.restaurants == null) {
          return const Center(
            child: Text('No restaurants found'),
          );
        }

        return ListView.builder(
          itemCount: result.restaurants!.length,
          itemBuilder: (context, index) {
            final restaurant = result.restaurants![index];
            final isFavorite = favorites.any((r) => r.id == restaurant.id);
            
            return ListTile(
              title: Text(restaurant.name ?? 'Unnamed Restaurant'),
              subtitle: Text(
                restaurant.categories?.map((c) => c.title).join(', ') ?? '',
              ),
              trailing: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onTap: () {
                if (restaurant.id != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantDetailsScreen(
                        restaurantId: restaurant.id!,
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildFavoritesList(List<Restaurant> favorites) {
    if (favorites.isEmpty) {
      return const Center(
        child: Text('No favorite restaurants yet'),
      );
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final restaurant = favorites[index];
        return ListTile(
          title: Text(restaurant.name ?? 'Unnamed Restaurant'),
          subtitle: Text(
            restaurant.categories?.map((c) => c.title).join(', ') ?? '',
          ),
          trailing: const Icon(Icons.favorite, color: Colors.red),
          onTap: () {
            if (restaurant.id != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetailsScreen(
                    restaurantId: restaurant.id!,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
} 