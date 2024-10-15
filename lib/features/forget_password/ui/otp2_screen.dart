import 'package:care_nest/features/forget_password/ui/widgets/app_bar_title.dart';
import 'package:care_nest/features/forget_password/ui/widgets/otp2_screen_body.dart';
import 'package:flutter/material.dart';

class Otp2Screen extends StatelessWidget {
  const Otp2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const AppBarTittle(),
      ),
      body: const Otp2ScreenBody(),
    );
  }
}
