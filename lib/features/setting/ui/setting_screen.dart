import 'package:care_nest/features/setting/ui/widgets/setting_screen_body.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SettingScreenBody(),
    );
  }
}
