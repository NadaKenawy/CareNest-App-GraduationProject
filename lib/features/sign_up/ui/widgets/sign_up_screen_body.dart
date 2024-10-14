import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/ui/widgets/alternativeaction_whenhaveaccount.dart';
import 'package:care_nest/features/sign_up/ui/widgets/date_of_birth_field%20.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_image.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  void _onDaySelected(int? value) {}

  void _onMonthSelected(int? value) {}

  void _onYearSelected(int? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const SignUpImage(),
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
                    const SignUpTitle(),
                    SizedBox(height: 24.h),
                    const SignupForm(),
                    SizedBox(height: 16.h),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date Of Birth",
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorsManager.primaryBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    DateOfBirthDropdowns(
                      onDaySelected: _onDaySelected,
                      onMonthSelected: _onMonthSelected,
                      onYearSelected: _onYearSelected,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextButton(
                      buttonText: "Sign Up",
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
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
                        GoRouter.of(context).push(AppRouter.kloginScreen);
                      },
                      textLabel: "Aleardy have an account?",
                      textButtonLabel: "Log In",
                    ),
                    const SignupBlocListener(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
