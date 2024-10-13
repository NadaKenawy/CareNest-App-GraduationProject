import 'package:care_nest/core/utils/colors.dart';
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
    this.obscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.width,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1.3.w,
                ),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  color: ColorsData.primaryBlueColor,
                  width: 2.w,
                ),
              ),
          hintText: hintText,
          hintStyle:
              hintStyle ?? const TextStyle(color: ColorsData.primaryBlueColor),
          suffixIcon: SizedBox(
            width: 24.w,
            height: 24.h,
            child: suffixIcon,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        obscureText: obscureText ?? false,
      ),
    );
  }
}
