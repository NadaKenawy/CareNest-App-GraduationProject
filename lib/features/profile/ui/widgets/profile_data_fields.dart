import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileDataFields extends StatelessWidget {
  const ProfileDataFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  width: 170.w,
                  hintText: 'First Name',
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: AppTextFormField(
                  width: 170.w,
                  hintText: 'Last Name',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const AppTextFormField(
            hintText: 'Email',
          ),
          SizedBox(
            height: 16.h,
          ),
          const AppTextFormField(
            hintText: '22/7/2003',
          ),
          SizedBox(
            height: 16.h,
          ),
          const AppTextFormField(
            hintText: '22/7/2003',
          ),
          SizedBox(
            height: 32.h,
          ),
          AppTextButton(
            buttonText: "Save Changes",
            onPressed: () {},
            textStyle: TextStyles.font16WhiteBold.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
        ],
      ),
    );
  }
}
