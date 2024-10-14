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

  @override
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            hasError: loginCubit.formKey.currentState != null &&
                !loginCubit.formKey.currentState!
                    .validate(), // تأكد من عكس النتيجة
            controller: loginCubit.emailController,
          ),
          const SizedBox(height: 18),
          FormField<String>(
            validator: (value) {
              if (loginCubit.passwordController.text.isEmpty) {
                return 'Please enter your password';
              }
              if (loginCubit.passwordController.text.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
            builder: (state) {
              return AppTextFormField(
                controller: loginCubit.passwordController,
                hintText: 'Password',
                isObscureText: isObscure,
                hasError: state.hasError, // استخدم حالة الخطأ هنا
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
                    color: state.hasError
                        ? Colors.red
                        : ColorsManager.primaryBlueColor,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
