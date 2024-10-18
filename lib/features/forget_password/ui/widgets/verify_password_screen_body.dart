import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
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
    final verifyPasswordCubit = context.read<VerifyPasswordCubit>();

    final otpFocus1 = FocusNode();
    final otpFocus2 = FocusNode();
    final otpFocus3 = FocusNode();
    final otpFocus4 = FocusNode();
    final otpFocus5 = FocusNode();
    final otpFocus6 = FocusNode();

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
                        context,
                        verifyPasswordCubit.otpField1Controller,
                        otpFocus1,
                        null,
                        otpFocus2)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyPasswordCubit.otpField2Controller,
                        otpFocus2,
                        otpFocus1,
                        otpFocus3)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyPasswordCubit.otpField3Controller,
                        otpFocus3,
                        otpFocus2,
                        otpFocus4)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyPasswordCubit.otpField4Controller,
                        otpFocus4,
                        otpFocus3,
                        otpFocus5)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyPasswordCubit.otpField5Controller,
                        otpFocus5,
                        otpFocus4,
                        otpFocus6)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyPasswordCubit.otpField6Controller,
                        otpFocus6,
                        otpFocus5,
                        null)),
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
              },
            ),
            SizedBox(height: 48.h),
            AlternativeActionWhenHaveAccount(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.scale,
                  title: 'Code Sent Successfully',
                  desc:
                      'The verification code has been successfully resent to your email.',
                  btnOkOnPress: () {
                    GoRouter.of(context).go(AppRouter.kVerifyPasswordScreen);
                  },
                  btnOkColor: ColorsManager.primaryBlueColor,
                ).show();
                context.read<ForgetPasswordCubit>().emitForgetPasswordStates();
              },
              textLabel: "Didn’t receive code?",
              textButtonLabel: "Resend code",
            ),
            const VerifyPassBlocListner(),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, TextEditingController controller,
      FocusNode currentFocus, FocusNode? previousFocus, FocusNode? nextFocus) {
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
      focusNode: currentFocus,
      onChanged: (value) {
        if (value.length == 1) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        } else if (value.isEmpty && previousFocus != null) {
          FocusScope.of(context).requestFocus(previousFocus);
        }
      },
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
