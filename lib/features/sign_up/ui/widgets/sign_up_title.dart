import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to Care",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeightHelper.bold,
            color: ColorsManager.primaryBlueColor,
          ),
        ),
        Text(
          "Nest",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeightHelper.bold,
            color: ColorsManager.primaryPinkColor,
          ),
        ),
      ],
    );
  }
}
