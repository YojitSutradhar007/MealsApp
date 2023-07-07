import 'package:flutter/material.dart';
import 'package:meals_app/resources/resources.dart';
enum CategoryType { c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11 }

class Category {
  Category({
    required this.id,
    required this.item,
    required this.type,
    this.color=ColorManager.colorPink,
  });

  final String id;
  final CategoryType type;
  final String item;
  final Color color;
}
