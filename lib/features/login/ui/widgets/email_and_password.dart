import 'package:care_nest/core/helpers/app_regex.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  bool emailHasError = false;
  bool passwordHasError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                emailHasError = true; // Set error state
                setState(() {}); // Trigger UI update
                return 'Please enter your email';
              } else if (!AppRegex.isEmailValid(value)) {
                emailHasError = true; // Set error state
                setState(() {}); // Trigger UI update
                return 'Please enter a valid email';
              }
              emailHasError = false; // Clear error state
              setState(() {}); // Trigger UI update
              return null; // Return null if valid
            },
            controller: context.read<LoginCubit>().emailController,
            hasError: emailHasError,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObscure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: passwordHasError
                    ? Colors.red
                    : ColorsManager
                        .primaryBlueColor, // Change icon color on error
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                passwordHasError = true; // Set error state
                setState(() {}); // Trigger UI update
                return 'Please enter your password';
              } else if (value.length < 8) {
                passwordHasError = true; // Set error state
                setState(() {}); // Trigger UI update
                return 'Password must be at least 8 characters';
              }
              passwordHasError = false; // Clear error state
              setState(() {}); // Trigger UI update
              return null; // Return null if valid
            },
            hasError: passwordHasError,
          ),
        ],
      ),
    );
  }
}
