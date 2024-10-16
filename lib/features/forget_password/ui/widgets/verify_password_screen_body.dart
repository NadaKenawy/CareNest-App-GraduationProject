import 'dart:developer';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:care_nest/features/forget_password/ui/widgets/verify_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyPasswordScreenBody extends StatelessWidget {
  const VerifyPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    // الوصول إلى الـ VerifyPasswordCubit
    final verifyPasswordCubit = context.read<VerifyPasswordCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
      child: Form(
        key: verifyPasswordCubit.formKey,
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
                    child: _buildOtpField(
                        verifyPasswordCubit.otpField1Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        verifyPasswordCubit.otpField2Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        verifyPasswordCubit.otpField3Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        verifyPasswordCubit.otpField4Controller)),
                SizedBox(width: 8.w),
                Flexible(
                  child:
                      _buildOtpField(verifyPasswordCubit.otpField5Controller),
                ),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        verifyPasswordCubit.otpField6Controller)),
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
                String otpCode = verifyPasswordCubit.otpField1Controller.text +
                    verifyPasswordCubit.otpField2Controller.text +
                    verifyPasswordCubit.otpField3Controller.text +
                    verifyPasswordCubit.otpField4Controller.text +
                    verifyPasswordCubit.otpField5Controller.text +
                    verifyPasswordCubit.otpField6Controller.text;

                log("OTP Code: $otpCode");
                if (!validateThenVerify(context)) {
                  return;
                }
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
            const VerifyPassBlocListner(),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpField(TextEditingController controller) {
    return AppTextFormField(
      hintText: '',
      width: 56.w,
      maxLength: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*';
        }
      },
      controller: controller,
    );
  }

  bool validateThenVerify(BuildContext context) {
    final form = context.read<VerifyPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<VerifyPasswordCubit>().emitVerifyPasswordStates();
      return true;
    }
    return false;
  }
}
