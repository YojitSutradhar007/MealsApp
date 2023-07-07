import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_list.dart';
import 'package:meals_app/model/category.dart';
import '../screens/screens.dart';

class CategoryViewItem extends StatelessWidget {
  const CategoryViewItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsScreen(
              mealList: mealData.where((element) => element.categories.contains(category.id)).toList(),
              title: category.item,
            ),
          ),
        );
      },
      splashColor: Colors.white.withGreen(155).withOpacity(0.8),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.55),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            category.item,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
