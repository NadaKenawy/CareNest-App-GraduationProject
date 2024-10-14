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
    required this.validator,
    this.controller,
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
  final Function(String?) validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: SizedBox(
        height: 48.h,
        child: TextFormField(
          controller: controller,
          style: inputTextStyle ??
              hintStyle ??
              const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    color: ColorsManager.primaryPinkColor,
                    width: 2.w,
                  ),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    color: ColorsManager.primaryBlueColor,
                    width: 2.w,
                  ),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.3.w,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.3.w,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(color: ColorsManager.primaryPinkColor),
            suffixIcon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: suffixIcon,
            ),
            filled: true,
            fillColor: Colors.transparent,
          ),
          obscureText: isObscureText ?? false,
          validator: (value) {
            return validator(value);
          },
        ),
      ),
    );
  }
}
