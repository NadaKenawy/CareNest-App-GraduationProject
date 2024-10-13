import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors_manager.dart';

class PasswordField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final VoidCallback onVisibilityToggle;
  final bool isVisible;

  const PasswordField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.onVisibilityToggle,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: hintText,
      obscureText: obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          isVisible ? Icons.visibility : Icons.visibility_off,
          color: ColorsManager.primaryBlueColor,
        ),
        onPressed: onVisibilityToggle,
      ),
    );
  }
}
