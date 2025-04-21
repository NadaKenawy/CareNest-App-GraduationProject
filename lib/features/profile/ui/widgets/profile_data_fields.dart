import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileDataFields extends StatelessWidget {
  const ProfileDataFields({super.key, required this.user});
  final UserModel user;
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
                  hintText: user.firstname,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: AppTextFormField(
                  width: 170.w,
                  hintText: user.lastname,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          AppTextFormField(
            hintText: user.email,
          ),
          SizedBox(
            height: 16.h,
          ),
          AppTextFormField(
            hintText: user.dateOfBirth != null
                ? DateFormat('d/M/yyyy').format(user.dateOfBirth!)
                : 'Date not available',
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
