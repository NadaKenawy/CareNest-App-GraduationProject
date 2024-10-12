import 'package:care_nest/core/utils/colors.dart';
import 'package:care_nest/core/utils/font_weight_helper.dart';
import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Welcome to Care",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeightHelper.bold,
              color: ColorsData.primaryBlueColor,
            ),
          ),
          TextSpan(
            text: "Nest",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeightHelper.bold,
              color: ColorsData.primaryPinkColor,
            ),
          ),
        ],
      ),
    );
  }
}
