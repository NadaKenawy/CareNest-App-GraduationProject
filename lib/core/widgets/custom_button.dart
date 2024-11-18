import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final List<Color>? gradientColors;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.gradientColors,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight = 48,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            gradient: gradientColors != null
                ? LinearGradient(
                    colors: gradientColors!,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
            color:
                gradientColors == null ? ColorsManager.primaryPinkColor : null,
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: textStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
