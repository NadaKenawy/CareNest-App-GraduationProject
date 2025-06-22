import 'package:care_nest/core/helpers/app_regex.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/core/widgets/dont_have_an_account.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../logic/update_pass_cubit/update_pass_cubit.dart';

class ChangePasswordScreenBody extends StatefulWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  _ChangePasswordScreenBodyState createState() =>
      _ChangePasswordScreenBodyState();
}

class _ChangePasswordScreenBodyState extends State<ChangePasswordScreenBody> {
  final formKey = GlobalKey<FormState>();

  bool isCurrentPasswordObscureText = true;
  bool currentPasswordHasError = false;

  bool isPasswordObscureText = true;
  bool passwordHasError = false;

  bool isPasswordConfirmationObscureText = true;
  bool confirmPasswordHasError = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<UpdatePassCubit>().formKey,
        child: Column(
          children: [
            const SettingAppBar(title: 'Change Password', showBackButton: true),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your new password must be unique from those previously used",
                      style: TextStyles.font16PrimaryBlueMedium
                          .copyWith(fontSize: 20),
                    ),
                    SizedBox(height: 36.h),
                    AppTextFormField(
                      hintText: 'Current Password',
                      isObscureText: isCurrentPasswordObscureText,
                      hasError: currentPasswordHasError,
                      controller:
                          context.read<UpdatePassCubit>().oldPassController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isCurrentPasswordObscureText =
                                !isCurrentPasswordObscureText;
                          });
                        },
                        child: Icon(
                          isCurrentPasswordObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: currentPasswordHasError
                              ? Colors.red
                              : ColorsManager.primaryBlueColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          currentPasswordHasError = true;
                          setState(() {});
                          return 'Current password is required';
                        }
                        currentPasswordHasError = false;
                        setState(() {});
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    AppTextFormField(
                      hintText: 'New Password',
                      controller:
                          context.read<UpdatePassCubit>().newPassController,
                      isObscureText: isPasswordObscureText,
                      hasError: passwordHasError,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordObscureText = !isPasswordObscureText;
                          });
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
                    ),
                    SizedBox(height: 24.h),
                    AppTextFormField(
                      hintText: 'Password Confirmation',
                      controller:
                          context.read<UpdatePassCubit>().confirmPassController,
                      isObscureText: isPasswordConfirmationObscureText,
                      hasError: confirmPasswordHasError,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordConfirmationObscureText =
                                !isPasswordConfirmationObscureText;
                          });
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
                        if (value !=
                            context
                                .read<UpdatePassCubit>()
                                .newPassController
                                .text) {
                          confirmPasswordHasError = true;
                          setState(() {});
                          return 'Password Confirmation incorrect';
                        }
                        confirmPasswordHasError = false;
                        setState(() {});
                        return null;
                      },
                    ),
                    SizedBox(height: 36.h),
                    AppTextButton(
                      buttonText: 'Update Password',
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {
                        validateThenUpdatePass(context);
                      },
                    ),
                    SizedBox(height: 36.h),
                    DontHaveAnAccount(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kForgetPassScreen,
                          extra: true,
                        );
                      },
                      textLabel: "Forgot your password?",
                      textButtonLabel: "Reset it",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
    void validateThenUpdatePass(BuildContext context) {
    final cubit = context.read<UpdatePassCubit>();
    final form = cubit.formKey.currentState;
    if (form!.validate()) {
      cubit.emitUpdatePassStates();
    }
  }
}
