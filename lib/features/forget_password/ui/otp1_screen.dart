import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/forget_password/ui/widgets/app_bar_title.dart';
import 'package:care_nest/features/forget_password/ui/widgets/otp1_screen_body.dart';
import 'package:flutter/material.dart';

class Otp1Screen extends StatelessWidget {
  const Otp1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: ColorsManager.primaryBlueColor,
            size: 28 // استبدل هذا اللون باللون الذي تريده
            ),
        title: const AppBarTittle(),
      ),
      body: const Otp1ScreenBody(),
    );
  }
}
