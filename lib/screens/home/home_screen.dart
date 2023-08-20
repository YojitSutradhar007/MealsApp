import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_list.dart';
import 'package:meals_app/widgets/widgets.dart';
import '../../resources/resources.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key,required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu,color: ColorManager.colorWhite,),
        ),

        title: const Text(
          "Categories",
          style: TextStyle(color: ColorManager.colorWhite),
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
