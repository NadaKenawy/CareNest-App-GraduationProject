import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight = 48,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    Color? backgroundColor,
  }) : backgroundColor = backgroundColor ?? ColorsManager.primaryPinkColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
          fixedSize: WidgetStatePropertyAll(
            Size(double.infinity, buttonHeight),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
