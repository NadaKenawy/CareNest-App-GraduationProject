// ignore_for_file: library_private_types_in_public_api

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/helpers/app_regex.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordScreenBody extends StatefulWidget {
  const CreateNewPasswordScreenBody({super.key});

  @override
  _CreateNewPasswordScreenBodyState createState() =>
      _CreateNewPasswordScreenBodyState();
}

class _CreateNewPasswordScreenBodyState
    extends State<CreateNewPasswordScreenBody> {
  bool isPasswordObscureText = true;
  bool passwordHasError = false;
  bool isPasswordConfirmationObscureText = true;
  bool confirmPasswordHasError = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateNewPasswordCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Password",
                style: TextStyles.font32PrimaryBlueBold,
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Text(
                  "Your new password must be unique from those previously used",
                  style: TextStyles.font16PrimaryBlueMedium,
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              AppTextFormField(
                hintText: 'New Password',
                isObscureText: isPasswordObscureText,
                hasError: passwordHasError,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isPasswordObscureText = !isPasswordObscureText;
                      },
                    );
                  },
                  child: Icon(
                    isPasswordObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: passwordHasError
                        ? Colors.red
                        : ColorsManager.primaryBlueColor,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    passwordHasError = true;
                    setState(() {});
                    return 'Password required';
                  }
                  if (value.length < 8) {
                    passwordHasError = true;
                    setState(() {});
                    return 'Password must be at least 8 characters';
                  }
                  if (!AppRegex.isPasswordValid(value)) {
                    passwordHasError = true;
                    setState(() {});
                    return 'Password must include an uppercase letter, lowercase letter, number, and special character.';
                  }
                  passwordHasError = false;
                  setState(() {});
                  return null;
                },
                controller: cubit.newPasswordController,
              ),
              SizedBox(
                height: 24.h,
              ),
              AppTextFormField(
                hintText: 'Password Confirmation',
                isObscureText: isPasswordConfirmationObscureText,
                hasError: confirmPasswordHasError,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isPasswordConfirmationObscureText =
                            !isPasswordConfirmationObscureText;
                      },
                    );
                  },
                  child: Icon(
                    isPasswordConfirmationObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: confirmPasswordHasError
                        ? Colors.red
                        : ColorsManager.primaryBlueColor,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    confirmPasswordHasError = true;
                    setState(() {});
                    return 'Password Confirmation required';
                  }
                  if (value != cubit.newPasswordController.text) {
                    confirmPasswordHasError = true;
                    setState(() {});
                    return 'Password Confirmation incorrect';
                  }
                  confirmPasswordHasError = false;
                  setState(() {});
                  return null;
                },
                controller: cubit.passwordConfirmController,
              ),
              SizedBox(
                height: 36.h,
              ),
              AppTextButton(
                buttonText: 'Reset Password',
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () {
                  validateThenSendCode(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenSendCode(BuildContext context) {
    final form = context.read<CreateNewPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      String newPassword =
          context.read<CreateNewPasswordCubit>().newPasswordController.text;
      String passwordConfirm =
          context.read<CreateNewPasswordCubit>().passwordConfirmController.text;

      if (newPassword == passwordConfirm) {
        context.read<CreateNewPasswordCubit>().emitCreateNewPasswordStates();
        GoRouter.of(context).push(AppRouter.kLoginScreen);
      } else {
        showErrorDialog(context, "Passwords do not match");
      }
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: message,
      btnOkText: 'Got it',
      btnOkOnPress: () {},
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
