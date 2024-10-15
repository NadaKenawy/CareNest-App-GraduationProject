import 'package:care_nest/core/helpers/app_regex.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool firstNameHasError = false;
  bool lastNameHasError = false;
  bool emailHasError = false;
  bool passwordHasError = false;
  bool confirmPasswordHasError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          // First Name
          Row(
            children: [
              AppTextFormField(
                width: 170.w,
                hintText: 'First Name',
                hasError: firstNameHasError,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    firstNameHasError = true;
                    setState(() {});
                    return 'firstname required';
                  }
                  if (value.length < 3) {
                    firstNameHasError = true;
                    setState(() {});
                    return 'at least 3 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    firstNameHasError = true;
                    setState(() {});
                    return 'only English letters';
                  }
                  firstNameHasError = false;
                  setState(() {});
                  return null;
                },
                controller: context.read<SignupCubit>().firstNameController,
              ),
              SizedBox(width: 16.w),
              AppTextFormField(
                width: 170.w,
                hintText: 'Last Name',
                hasError: lastNameHasError,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    lastNameHasError = true;
                    setState(() {});
                    return 'lastname required';
                  }
                  if (value.length < 3) {
                    lastNameHasError = true;
                    setState(() {});
                    return 'at least 3 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    lastNameHasError = true;
                    setState(() {});
                    return 'only English letters';
                  }
                  lastNameHasError = false;
                  setState(() {});
                  return null;
                },
                controller: context.read<SignupCubit>().lastNameController,
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            hintText: 'Email',
            hasError: emailHasError,
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
                return 'email must start with a character, match the \'@\' symbol, and end with \'gmail.com\'';
              }
              emailHasError = false;
              setState(() {});
              return null;
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            hasError: passwordHasError,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
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
                return 'password must be at least 8 characters';
              }
              if (!RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                  .hasMatch(value)) {
                passwordHasError = true;
                setState(() {});
                return 'Password must be at least 8 characters, have at least one capital letter, one small letter, one digit, and one special character';
              }
              passwordHasError = false;
              setState(() {});
              return null;
            },
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordConfirmController,
            hintText: 'Password Confirmation',
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
                  context.read<SignupCubit>().passwordController.text) {
                confirmPasswordHasError = true;
                setState(() {});
                return 'Password Confirmation incorrect';
              }
              confirmPasswordHasError = false;
              setState(() {});
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
