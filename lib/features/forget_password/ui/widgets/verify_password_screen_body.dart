import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/dont_have_an_account.dart';
import '../../logic/forget_password_cubit/forget_password_cubit.dart';
import 'verify_password_bloc_listener.dart';

class VerifyPasswordScreenBody extends StatelessWidget {
  const VerifyPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55.w,
      height: 55.h,
      textStyle: TextStyles.font16PrimaryBlackMedium,
      decoration: BoxDecoration(
        color: const Color(0xffe5e9ef),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffe5e9ef), width: 2),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: const Color(0xffe5e9ef),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorsManager.primaryBlueColor, width: 2),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OTP Verification",
            style: TextStyles.font36PrimaryBlueBold,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "Enter the verification code we just sent on your email address.",
            style: TextStyles.font16SecondaryBlueBold,
          ),
          SizedBox(
            height: 36.h,
          ),
          Form(
            key: context.read<VerifyPasswordCubit>().formKey,
            child: Pinput(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Verification code is required';
                }
                return null;
              },
              controller: context.read<VerifyPasswordCubit>().otpField,
              length: 6,
              showCursor: true,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          AppTextButton(
            buttonText: 'Send Code',
            textStyle: TextStyles.font16WhiteBold,
            onPressed: () {
              validateThenVerify(context);
            },
          ),
          SizedBox(
            height: 48.h,
          ),
          DontHaveAnAccount(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.scale,
                title: 'Code Sent Successfully',
                desc:
                    'The verification code has been successfully resent to your email.',
                btnOkOnPress: () {},
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
    );
  }

  void validateThenVerify(BuildContext context) {
    final form = context.read<VerifyPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<VerifyPasswordCubit>().emitVerifyPasswordStates();
    }
  }
}
