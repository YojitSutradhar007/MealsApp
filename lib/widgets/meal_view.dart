
import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/resources/resources.dart';
import 'package:transparent_image/transparent_image.dart';

class MealView extends StatelessWidget {
  const MealView({
    super.key,
    required this.mealList,
  });

  final Meals mealList;

  String get complexity {
    return mealList.complexity.name[0].toUpperCase() + mealList.complexity.name.substring(1);
  }

  String get affordability {
    return mealList.affordability.name[0].toUpperCase() + mealList.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          width: double.infinity,
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(
            mealList.imageUrl,
          ),
          fit: BoxFit.cover,
          height: 200,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: ColorManager.colorBlack45,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    mealList.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealSubData(title: "${mealList.duration}mins", icon: Icons.access_time),
                    MealSubData(title: complexity, icon: Icons.work),
                    MealSubData(title: affordability, icon: Icons.attach_money_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MealSubData extends StatelessWidget {
  const MealSubData({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Icon(icon, color: ColorManager.colorWhite, size: 20),
          const SizedBox(
            width: 5,
          ),
          Text(title)
        ],
      ),
    );
  }
}
