import 'package:care_nest/features/setting/ui/change_password/ui/widgets/change_password_screen_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ChangePasswordScreenBody(),
    );
  }
}
