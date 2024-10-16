import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyAccountScreenBody extends StatelessWidget {
  const VerifyAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Verify Your Account",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeightHelper.bold,
              color: ColorsManager.primaryBlueColor,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: const Text(
              "Enter the 6-digit verification code we sent to your email address.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeightHelper.bold,
                color: ColorsManager.secondryBlueColor,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          Row(
            children: [
              Flexible(child: _buildOtpField()),
              SizedBox(width: 16.w),
              Flexible(child: _buildOtpField()),
              SizedBox(width: 16.w),
              Flexible(child: _buildOtpField()),
              SizedBox(width: 16.w),
              Flexible(child: _buildOtpField()),
              SizedBox(width: 16.w),
              Flexible(child: _buildOtpField()),
              SizedBox(width: 16.w),
              Flexible(child: _buildOtpField()),
            ],
          ),
          SizedBox(height: 36.h),
          AppTextButton(
            buttonText: 'Verify Account',
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kHomeScreen);
            },
          ),
          SizedBox(height: 48.h),
          AlternativeActionWhenHaveAccount(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLoginScreen);
            },
            textLabel: "Didn’t receive the code?",
            textButtonLabel: "Resend code",
          ),
        ],
      ),
    );
  }

  Widget _buildOtpField() {
    return AppTextFormField(
      hintText: '',
      width: 48.w,
    );
  }
}
