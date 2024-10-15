import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Otp2ScreenBody extends StatelessWidget {
  const Otp2ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "OTP Verification",
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
              "Enter the verification code we just sent on your email address.",
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
              Flexible(
                child: _buildOtpField(),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: _buildOtpField(),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: _buildOtpField(),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: _buildOtpField(),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: _buildOtpField(),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: _buildOtpField(),
              ),
            ],
          ),
          SizedBox(height: 36.h),
          AppTextButton(
            buttonText: 'Send Code',
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kOtp3Screen);
            },
          ),
          SizedBox(height: 48.h),
          AlternativeActionWhenHaveAccount(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kloginScreen);
            },
            textLabel: "Don’t receive code?",
            textButtonLabel: "Resend code",
          ),
        ],
      ),
    );
  }

  Widget _buildOtpField() {
    return AppTextFormField(
      hintText: '',
      width: 56.w,
    );
  }
}
