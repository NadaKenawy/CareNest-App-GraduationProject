import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Otp3ScreenBody extends StatelessWidget {
  const Otp3ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create New Password",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeightHelper.bold,
              color: ColorsManager.primaryBlueColor,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: const Text(
                "Your new password must be unique from those previously used",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeightHelper.bold,
                  color: ColorsManager.secondryBlueColor,
                )),
          ),
          SizedBox(
            height: 36.h,
          ),
          const AppTextFormField(
            hintText: 'New Password',
          ),
          SizedBox(
            height: 24.h,
          ),
          const AppTextFormField(
            hintText: 'Confirm Password',
          ),
          SizedBox(
            height: 36.h,
          ),
          AppTextButton(
            buttonText: 'Reset password',
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kOtp2Screen);
            },
          ),
        ],
      ),
    );
  }
}
