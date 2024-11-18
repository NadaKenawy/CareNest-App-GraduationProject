import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AddBabyScreenBody extends StatelessWidget {
  const AddBabyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [Image.asset(AppImages.gradientBoyAndGirlImage)],
      ),
    );
  }
}
