import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color backgroundColor; // اجعلها مطلوبة
  final double? horizontalPadding;
  final double? verticalPadding;
  final double buttonHeight; // اجعلها مطلوبة
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight = 48, // تعيين قيمة افتراضية للطول
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    Color? backgroundColor, // اجعلها مطلوبة
  }) : backgroundColor =
            backgroundColor ?? Colors.pink; // تعيين لون افتراضي للزر

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // جعل العرض يمتد لعرض الشاشة بالكامل
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(
              backgroundColor), // تعيين لون الخلفية
          fixedSize: WidgetStatePropertyAll(
            Size(double.infinity,
                buttonHeight), // جعل العرض يمتد لعرض الشاشة بالكامل
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle.copyWith(
              color: Colors.white), // تعيين لون النص إلى الأبيض
        ),
      ),
    );
  }
}
