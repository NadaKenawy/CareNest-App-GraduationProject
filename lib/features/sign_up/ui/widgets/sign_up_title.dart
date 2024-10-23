import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to Care",
          style: TextStyles.font24PrimaryBlueBold,
        ),
        Text(
          "Nest",
          style: TextStyles.font24PrimaryPinkBold,
        ),
      ],
    );
  }
}
