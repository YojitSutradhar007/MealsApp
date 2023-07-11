import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/meals_screen/favouriite_meals_provider.dart';
import '../screens.dart';

class DashBoard extends ConsumerWidget  {
  const DashBoard({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealList=ref.watch(favouriteMeal);

    final List<Widget> screens = [
      const HomeScreen(),
      //Favourites meals screen
        MealsScreen(
        title: "Favourite Meals",
        mealList:mealList,
      ),
    ];

    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final int index = ref.watch(dashboardIndex);
          return screens[index];
        },
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final int index0 = ref.watch(dashboardIndex);
          return BottomNavigationBar(
            onTap: (index) {
              ref.read(dashboardIndex.notifier).update((state) => state = index);
            },
            currentIndex: index0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.food_bank_outlined), label: "Meal"),
              BottomNavigationBarItem(icon: Icon(Icons.star_border_purple500_outlined), label: "Favourite"),
            ],
          );
        },
      ),
    );
  }
}

final dashboardIndex = StateProvider((ref) => 0);
