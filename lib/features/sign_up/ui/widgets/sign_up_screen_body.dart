import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/dont_have_an_account.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const SignUpImage(),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorsManager.primaryBlueColor,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 370.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                  horizontal: 16.w,
                ),
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
                    SizedBox(
                      height: 24.h,
                    ),
                    const SignupForm(),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextButton(
                      buttonText: "Sign Up",
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                      textStyle: TextStyles.font16WhiteBold,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    DontHaveAnAccount(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kLoginScreen);
                      },
                      textLabel: "Already have an account?",
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
