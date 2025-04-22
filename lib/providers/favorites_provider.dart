import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant.dart';

class FavoritesNotifier extends StateNotifier<List<Restaurant>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(Restaurant restaurant) {
    if (state.any((r) => r.id == restaurant.id)) {
      state = state.where((r) => r.id != restaurant.id).toList();
    } else {
      state = [...state, restaurant];
    }
  }

  bool isFavorite(Restaurant restaurant) {
    return state.any((r) => r.id == restaurant.id);
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Restaurant>>((ref) {
  return FavoritesNotifier();
}); 