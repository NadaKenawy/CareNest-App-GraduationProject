import 'dart:developer';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/sign_up/ui/widgets/verify_account_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyAccountScreenBody extends StatelessWidget {
  const VerifyAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyAccountCubit = context.read<VerifyAccountCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
      child: Form(
        key: verifyAccountCubit.formKey,
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
                Flexible(
                    child:
                        _buildOtpField(verifyAccountCubit.otpField1Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child:
                        _buildOtpField(verifyAccountCubit.otpField2Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child:
                        _buildOtpField(verifyAccountCubit.otpField3Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child:
                        _buildOtpField(verifyAccountCubit.otpField4Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child:
                        _buildOtpField(verifyAccountCubit.otpField5Controller)),
                SizedBox(width: 8.w),
                Flexible(
                    child:
                        _buildOtpField(verifyAccountCubit.otpField6Controller)),
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
                String otpCode = verifyAccountCubit.otpField1Controller.text +
                    verifyAccountCubit.otpField2Controller.text +
                    verifyAccountCubit.otpField3Controller.text +
                    verifyAccountCubit.otpField4Controller.text +
                    verifyAccountCubit.otpField5Controller.text +
                    verifyAccountCubit.otpField6Controller.text;

                log("OTP Code: $otpCode");

                if (!validateThenVerify(context)) {
                  return;
                }
              },
            ),
            SizedBox(height: 48.h),
            AlternativeActionWhenHaveAccount(
              onTap: () {
                context.read<SignupCubit>().emitSignupStates();
              },
              textLabel: "Didn’t receive the code?",
              textButtonLabel: "Resend code",
            ),
            const VerifyAccountBlocListner(),
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
    final form = context.read<VerifyAccountCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<VerifyAccountCubit>().emitVerifyAccountStates();
      return true;
    }
    return false;
  }
}
