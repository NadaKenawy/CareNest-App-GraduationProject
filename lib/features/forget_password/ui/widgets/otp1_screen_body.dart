import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Otp1ScreenBody extends StatelessWidget {
  const Otp1ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Forget Password?",
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
            padding: EdgeInsets.only(right: 32.w),
            child: const Text(
                "Don't worry!. Please enter the email address linked with your account.",
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
            hintText: 'Email',
          ),
          SizedBox(
            height: 36.h,
          ),
          AppTextButton(
            buttonText: 'Send Code',
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            onPressed: () {},
          ),
          SizedBox(height: 12.h),
          AlternativeActionWhenHaveAccount(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kloginScreen);
            },
            textLabel: "Remember Password?",
            textButtonLabel: "Log in",
          )
        ],
      ),
    );
  }
}
