import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/dont_have_an_account.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/login/ui/widgets/email_and_password.dart';
import 'package:care_nest/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:care_nest/features/login/ui/widgets/login_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const LoginImage(),
            Padding(
              padding: EdgeInsets.only(top: 370.h),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 350.h,
                padding: EdgeInsets.only(
                  top: 24.h,
                  left: 16.w,
                  right: 16.w,
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
                    Text(
                      'Welcome Back!',
                      style: TextStyles.font24PrimaryBlueSemiBold,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const EmailAndPassword(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.kForgetPassScreen);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.font16PrimaryBlueRegular,
                        ),
                      ),
                    ),
                    AppTextButton(
                      buttonText: "Log In",
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                      textStyle: TextStyles.font16WhiteBold,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    DontHaveAnAccount(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kSignUpScreen);
                      },
                      textLabel: "Don't have an account?",
                      textButtonLabel: "Sign Up",
                    ),
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    final form = context.read<LoginCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
