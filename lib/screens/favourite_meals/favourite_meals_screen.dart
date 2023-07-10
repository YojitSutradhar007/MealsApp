import 'package:flutter/material.dart';

class FavouriteMeals extends StatelessWidget {
  const FavouriteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite Meals"),),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text("Favourite Meals")
          ],
        ),
      ),
    );
  }
}
