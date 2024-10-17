import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

void successSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.primaryBlueColor,
      content: Text(
        text,
        style: const TextStyle(
          fontFamily: 'QuickSand',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
