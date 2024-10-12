import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [Image.asset(AppImages.signUpImg),
              
              ],

            ),
          ),

        ],
      ),
    );
  }
}
