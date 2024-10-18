import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
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
import 'package:go_router/go_router.dart';

class VerifyAccountScreenBody extends StatelessWidget {
  const VerifyAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyAccountCubit = context.read<VerifyAccountCubit>();

    final otpFocus1 = FocusNode();
    final otpFocus2 = FocusNode();
    final otpFocus3 = FocusNode();
    final otpFocus4 = FocusNode();
    final otpFocus5 = FocusNode();
    final otpFocus6 = FocusNode();

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
                    child: _buildOtpField(
                        context,
                        verifyAccountCubit.otpField1Controller,
                        otpFocus1,
                        null,
                        otpFocus2)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyAccountCubit.otpField2Controller,
                        otpFocus2,
                        otpFocus1,
                        otpFocus3)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyAccountCubit.otpField3Controller,
                        otpFocus3,
                        otpFocus2,
                        otpFocus4)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyAccountCubit.otpField4Controller,
                        otpFocus4,
                        otpFocus3,
                        otpFocus5)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyAccountCubit.otpField5Controller,
                        otpFocus5,
                        otpFocus4,
                        otpFocus6)),
                SizedBox(width: 8.w),
                Flexible(
                    child: _buildOtpField(
                        context,
                        verifyAccountCubit.otpField6Controller,
                        otpFocus6,
                        otpFocus5,
                        null)), // آخر خانة
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
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success, // Use success dialog type
                  animType: AnimType.scale,
                  title: 'Code Sent Successfully',
                  desc:
                      'The verification code has been successfully resend to your email.',
                  btnOkOnPress: () {
                    GoRouter.of(context).push(AppRouter.kVerifyAccountScreen);
                  },
                  btnOkColor: ColorsManager.primaryBlueColor,
                ).show();
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
          // إذا أدخل المستخدم حرفًا، انقل التركيز إلى الحقل التالي
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        } else if (value.isEmpty && previousFocus != null) {
          // إذا كان الحقل فارغًا، انقل التركيز إلى الحقل السابق
          FocusScope.of(context).requestFocus(previousFocus);
        }
      },
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
