import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/meals_screen/favouriite_meals_provider.dart';
import '../screens.dart';

class DashBoard extends ConsumerWidget {
    DashBoard({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealList = ref.watch(favouriteMeal);
    final List<Widget> screens = [
        HomeScreen(
          scaffoldKey: _scaffoldKey,
        ),
      //Favourites meals screen
      MealsScreen(
        title: "Favourite Meals",
        mealList: mealList,
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      body: Consumer(
        builder: (context, ref, child) {
          final int index = ref.watch(dashboardIndex);
          return screens[index];
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(193, 217, 255, 1.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fastfood_rounded,
                    size: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cooking.....",
                    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.set_meal),
              title: const Text(
                "Meals",
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.filter_alt_rounded),
              title: const Text(
                "Filters",
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
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
