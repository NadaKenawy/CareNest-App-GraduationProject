import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/dont_have_an_account.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
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
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;
  String? _dobErrorMessage; // Add this variable for the error message

  void _onDaySelected(int? value) {
    setState(() {
      _selectedDay = value;
      _dobErrorMessage = null; // Reset error message when day is selected
    });
  }

  void _onMonthSelected(int? value) {
    setState(() {
      _selectedMonth = value;
      _dobErrorMessage = null; // Reset error message when month is selected
    });
  }

  void _onYearSelected(int? value) {
    setState(() {
      _selectedYear = value;
      _dobErrorMessage = null; // Reset error message when year is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const SignUpImage(),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date Of Birth",
                        style: TextStyles.font14PrimaryBlueRegular,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    DateOfBirthDropdowns(
                      onDaySelected: _onDaySelected,
                      onMonthSelected: _onMonthSelected,
                      onYearSelected: _onYearSelected,
                      errorMessage: _dobErrorMessage, // Pass the error message
                    ),
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
    // Check if the form is valid
    if (context.read<SignupCubit>().formKey.currentState!.validate() &&
        _selectedDay != null &&
        _selectedMonth != null &&
        _selectedYear != null) {
      // Check if all Date of Birth fields are selected

      // Update Date of Birth in SignupCubit
      context.read<SignupCubit>().updateDateOfBirth(
            _selectedDay,
            _selectedMonth,
            _selectedYear,
          );

      // Emit the signup state
      context.read<SignupCubit>().emitSignupStates();
    } else {
      setState(
        () {
          if (_selectedDay == null ||
              _selectedMonth == null ||
              _selectedYear == null) {
            _dobErrorMessage = 'Please select your full date of birth';
          }
        },
      );
    }
  }
}
