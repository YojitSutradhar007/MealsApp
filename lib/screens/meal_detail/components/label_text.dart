import 'package:flutter/material.dart';


class HeadLine extends StatelessWidget {
  const HeadLine({
    super.key,
    required this.label
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
      ),
    );
  }
}
