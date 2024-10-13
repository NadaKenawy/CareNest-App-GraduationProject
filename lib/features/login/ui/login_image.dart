import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.loginImg,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
