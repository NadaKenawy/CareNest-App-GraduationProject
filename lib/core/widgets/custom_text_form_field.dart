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
    this.hasError = false,
    this.maxLength,
    this.keyboardType,
    this.textAlign,
    this.focusNode,
    this.onChanged, // إضافة textAlign كخاصية اختيارية
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
  final bool hasError;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    Color textColor = hasError ? Colors.red : ColorsManager.primaryBlueColor;
    Color hintColor = hasError ? Colors.red : ColorsManager.primaryBlueColor;

    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        style: inputTextStyle ?? TextStyle(color: textColor),
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          constraints: const BoxConstraints(minHeight: 48),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                    color: hasError ? Colors.red : Colors.blue, width: 2.w),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                    color:
                        hasError ? Colors.red : ColorsManager.primaryBlueColor,
                    width: 2.w),
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
          hintStyle: TextStyle(color: hintColor),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.transparent,
          errorMaxLines: 2,
          counterText: '',
        ),
        obscureText: isObscureText ?? false,
        validator: (value) {
          return validator!(value);
        },
        focusNode: focusNode,
        onChanged: onChanged,
      ),
    );
  }
}
