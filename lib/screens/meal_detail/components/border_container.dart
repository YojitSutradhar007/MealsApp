import 'package:flutter/material.dart';
import '../../../resources/resources.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.listItem,
  });

  final List<Widget> listItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorManager.colorWhite, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...listItem
        ],
      ),
    );
  }
}
