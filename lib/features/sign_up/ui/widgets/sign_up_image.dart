import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.signUpImage,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
