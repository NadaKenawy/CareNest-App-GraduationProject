import 'package:care_nest/core/helpers/app_regex.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:care_nest/features/forget_password/ui/widgets/forget_pass_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPassScreenBody extends StatefulWidget {
  const ForgetPassScreenBody({super.key});

  @override
  State<ForgetPassScreenBody> createState() => _ForgetPassScreenBodyState();
}

class _ForgetPassScreenBodyState extends State<ForgetPassScreenBody> {
  bool emailHasError = false;
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
            padding: EdgeInsets.only(right: 40.w),
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
          Form(
            key: context.read<ForgetPasswordCubit>().formKey,
            child: AppTextFormField(
              hintText: 'Email',
              hasError: emailHasError, // Pass the error state here
              validator: (value) {
                if (value == null || value.isEmpty) {
                  emailHasError = true;
                  setState(() {});
                  return 'Email required';
                }
                if (!AppRegex.isEmailValid(value)) {
                  emailHasError = true;
                  setState(() {});
                  return 'Invalid email';
                }
                if (!value.startsWith(RegExp(r'^[a-zA-Z]')) ||
                    !value.endsWith('@gmail.com')) {
                  emailHasError = true;
                  setState(() {});
                  return 'Email must start with a character and end with \'gmail.com\'';
                }
                emailHasError = false;
                setState(() {});
                return null;
              },
              controller: context.read<ForgetPasswordCubit>().emailController,
            ),
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
            onPressed: () {
              validateThenSendCode(context);
              //  GoRouter.of(context).push(AppRouter.kOtp2Screen);
            },
          ),
          SizedBox(height: 48.h),
          AlternativeActionWhenHaveAccount(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLoginScreen);
            },
            textLabel: "Remember Password?",
            textButtonLabel: "Log in",
          ),
          const ForgetPassBlocListner(),
        ],
      ),
    );
  }

  void validateThenSendCode(BuildContext context) {
    final form = context.read<ForgetPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<ForgetPasswordCubit>().emitForgetPasswordStates();
    }
  }
}
