import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/dont_have_an_account.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/sign_up/ui/widgets/verify_account_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyAccountScreenBody extends StatelessWidget {
  const VerifyAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55.w,
      height: 55.h,
      textStyle: TextStyles.font16BlackMedium,
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
            "Verify Your Account",
            style: TextStyles.font32PrimaryBlueBold,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "Enter the 6-digit verification code we sent to your email address.",
            style: TextStyles.font16PrimaryBlueMedium,
          ),
          SizedBox(
            height: 36.h,
          ),
          Form(
            key: context.read<VerifyAccountCubit>().formKey,
            child: Pinput(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Verification code is required';
                }
                return null;
              },
              controller: context.read<VerifyAccountCubit>().otpField,
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
            textStyle: TextStyles.font16WhiteMedium,
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
              context.read<SignupCubit>().emitSignupStates();
            },
            textLabel: "Didn’t receive code?",
            textButtonLabel: "Resend code",
          ),
          const VerifyAccountBlocListner(),
        ],
      ),
    );
  }

  void validateThenVerify(BuildContext context) {
    final form = context.read<VerifyAccountCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<VerifyAccountCubit>().emitVerifyAccountStates();
    }
  }
}
