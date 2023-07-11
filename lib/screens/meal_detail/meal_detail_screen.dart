import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/resources/color_manager.dart';
import '../../model/model.dart';
import '../meals_screen/favouriite_meals_provider.dart';
import 'components/border_container.dart';
import 'components/label_text.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    List<Widget> ingredientsList = [
      for (final element in meal.ingredients) ...[
        Text(
          element,
          textAlign: TextAlign.center,
        )
      ]
    ];
    List<Widget> stepsList = [
      for (final element in meal.steps) ...[
        Text(
          element,
          textAlign: TextAlign.start,
        )
      ]
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorManager.colorWhite),
        title: Text(
          meal.title,
          style: const TextStyle(color: ColorManager.colorWhite, fontSize: 18),
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final listContains = ref.watch(favouriteMeal);
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                    onPressed: () {
                      if(!listContains.contains(meal)){
                        debugPrint("added");
                        ref.read(favouriteMeal.notifier).addMeals(meal);
                      }
                      else{
                        debugPrint("remove");
                        ref.read(favouriteMeal.notifier).removeMeals(meal);
                      }
                    },
                    icon: listContains.contains(meal) ? const Icon(Icons.star) : const Icon(Icons.star_border)),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  imageUrl: meal.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const HeadLine(label: "ingredients"),
              BorderContainer(listItem: ingredientsList),
              const HeadLine(label: "Steps"),
              BorderContainer(listItem: stepsList)
            ],
          ),
        ),
      ),
    );
  }
}
