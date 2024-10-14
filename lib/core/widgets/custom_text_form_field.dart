import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.width,
    this.validator,
    this.controller,
    this.hasError = false, // إضافة متغير للتحقق من وجود خطأ
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final double? width;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final bool hasError; // تحديد إذا كان هناك خطأ

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: SizedBox(
        height: 70.h, // تثبيت الارتفاع لتجنب تغير الحجم مع الخطأ
        child: TextFormField(
          controller: controller,
          style: inputTextStyle ??
              hintStyle ??
              const TextStyle(color: ColorsManager.primaryBlueColor),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Colors.blue, width: 2.w),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                      color: ColorsManager.primaryBlueColor, width: 2.w),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3.w),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3.w),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: hasError
                  ? Colors.red
                  : ColorsManager
                      .primaryBlueColor, // استخدام اللون الأحمر عند وجود خطأ
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.transparent,
            errorMaxLines: 2,
          ),
          obscureText: isObscureText ?? false,
          validator: (value) {
            return validator!(value);
          },
        ),
      ),
    );
  }
}
