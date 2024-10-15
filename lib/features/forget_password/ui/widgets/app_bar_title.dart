import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Care",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeightHelper.bold,
              color: ColorsManager.primaryBlueColor,
            ),
          ),
          TextSpan(
            text: "Nest",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeightHelper.bold,
              color: ColorsManager.primaryPinkColor,
            ),
          ),
        ],
      ),
    );
  }
}
