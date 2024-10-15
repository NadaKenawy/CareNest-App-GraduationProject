import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/app_bar_title.dart';
import 'package:care_nest/features/forget_password/ui/widgets/otp3_screen_body.dart';
import 'package:flutter/material.dart';

class Otp3Screen extends StatelessWidget {
  const Otp3Screen({super.key});

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
      body: const Otp3ScreenBody(),
    );
  }
}
