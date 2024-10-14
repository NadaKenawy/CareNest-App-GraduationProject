import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstAndLastNameFields extends StatelessWidget {
  const FirstAndLastNameFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid email';
            }
          },
          hintText: "First Name",
          width: 170.w,
        ),
        SizedBox(
          width: 16.w,
        ),
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid email';
            }
          },
          hintText: "Last Name",
          width: 170.w,
        ),
      ],
    );
  }
}
