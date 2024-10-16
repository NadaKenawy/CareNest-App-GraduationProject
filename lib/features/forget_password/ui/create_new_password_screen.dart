import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/app_bar_title.dart';
import 'package:care_nest/features/forget_password/ui/widgets/create_new_password_screen_body.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorsManager.primaryBlueColor,
          size: 28,
        ),
        title: const AppBarTittle(),
      ),
      body: const CreateNewPasswordScreenBody(),
    );
  }
}
