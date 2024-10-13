import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/login/ui/login_image.dart';
import 'package:care_nest/features/sign_up/ui/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/features/sign_up/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const LoginImage(),
            Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.primaryBlueColor,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const AppTextFormField(
                      hintText: "Email",
                    ),
                    SizedBox(height: 16.h),
                    PasswordField(
                      hintText: "Password",
                      obscureText: !_isPasswordVisible,
                      onVisibilityToggle: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      isVisible: _isPasswordVisible,
                    ),
                    SizedBox(height: 13.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.primaryBlueColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppTextButton(
                      buttonText: "Log In",
                      onPressed: () {},
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      backgroundColor: ColorsManager.primaryPinkColor,
                      buttonHeight: 50.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    AlternativeActionWhenHaveAccount(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.ksignUpScreen);
                      },
                      textLabel: "Don't have an account?",
                      textButtonLabel: "Sign Up",
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
}
