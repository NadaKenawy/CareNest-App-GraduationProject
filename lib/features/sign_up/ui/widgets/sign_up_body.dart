import 'package:care_nest/core/utils/colors.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/sign_up/ui/widgets/date_of_birth_field%20.dart';
import 'package:care_nest/features/sign_up/ui/widgets/first_and_last_name_fields.dart';
import 'package:care_nest/features/sign_up/ui/widgets/password_field.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_image.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_title.dart';
import 'package:flutter/material.dart'; // تأكد من استيراد الودجت الجديد

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _onDaySelected(int? value) {}

  void _onMonthSelected(int? value) {}

  void _onYearSelected(int? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const SignUpImage(),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.46),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                    const SizedBox(height: 24),
                    const FirstAndLastNameFields(),
                    const SizedBox(height: 16),
                    const AppTextFormField(
                      hintText: "Email",
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    PasswordField(
                      hintText: "Confirm Password",
                      obscureText: !_isConfirmPasswordVisible,
                      onVisibilityToggle: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      isVisible: _isConfirmPasswordVisible,
                    ),
                    const SizedBox(height: 16),

                    // Use the new DateOfBirthDropdowns widget
                    DateOfBirthDropdowns(
                      onDaySelected: _onDaySelected,
                      onMonthSelected: _onMonthSelected,
                      onYearSelected: _onYearSelected,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextButton(
                      buttonText: "Sign Up",
                      onPressed: () {},
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      backgroundColor: ColorsData.primaryPinkColor,
                      buttonHeight: 48,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
