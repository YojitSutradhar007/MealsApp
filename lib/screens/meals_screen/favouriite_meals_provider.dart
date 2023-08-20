import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model.dart';

final favouriteMeal = StateNotifierProvider<FavouritesMealsList, List<Meals>>((ref) => FavouritesMealsList());
class FavouritesMealsList extends StateNotifier<List<Meals>> {
  FavouritesMealsList() : super([]);

  void addMeals(Meals meals) {
    state.add(meals);
    state = [...state];
  }

  void removeMeals(Meals meals) {
    state.remove(meals);
    state = [...state];
  }
}
