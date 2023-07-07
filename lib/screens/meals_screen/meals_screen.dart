import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/resources/resources.dart';
import 'package:meals_app/screens/screens.dart';
import '../../widgets/widgets.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.mealList,
  });

  final String title;
  final List<Meals> mealList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorManager.colorWhite),
        title: Text(
          title,
          style: const TextStyle(color: ColorManager.colorWhite, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: mealList.isEmpty
            ? const Column(
                children: [
                  Text("Oops! No data Found"),
                ],
              )
            : ListView.builder(
                itemCount: mealList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailScreen(
                            meal: mealList[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      child: MealView(mealList: mealList[index]),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
