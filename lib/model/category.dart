import 'package:flutter/material.dart';

class Category {
  Category({
    required this.id,
    required this.item,
    this.color=Colors.pink,
  });

  final String id;
  final String item;
  final Color color;
}
