import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/app_bar_title.dart';
import 'package:care_nest/features/sign_up/ui/widgets/verfiy_account_screen_body.dart';
import 'package:flutter/material.dart';

class VerfiyAccountScreen extends StatelessWidget {
  const VerfiyAccountScreen({super.key});

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
      body: const VerifyAccountScreenBody(),
    );
  }
}
