import 'package:flutter/material.dart';
import '../screens.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ValueNotifier<int> screenIndex = ValueNotifier(0);

  // int screenIndex =0;

  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteMeals(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: screenIndex,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: screenIndex,
        builder: (context, ref, child) {
          return BottomNavigationBar(
            onTap: (index) {
              screenIndex.value = index;
            },
            currentIndex: ref,
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
