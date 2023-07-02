import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_list.dart';
import 'package:meals_app/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // childAspectRatio: 8 / 78,
              ),
              children: [
                for (final element in itemList)
                  CategoryViewItem(
                    category: element,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
