import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Care",
          style: TextStyles.font24PrimaryBlueBold,
        ),
        Text(
          "Nest",
          style: TextStyles.font24PrimaryPinkBold,
        )
      ],
    );
  }
}
