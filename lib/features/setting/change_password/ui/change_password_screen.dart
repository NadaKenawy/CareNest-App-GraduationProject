import 'package:care_nest/features/setting/change_password/ui/widgets/change_password_screen_body.dart';
import 'package:care_nest/features/setting/change_password/ui/widgets/update_pass_bloc_listener.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ChangePasswordScreenBody(),
          UpdatePassBlocListener(),
        ],
      ),
    );
  }
}
