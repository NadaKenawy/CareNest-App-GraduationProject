import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_image.dart';
import 'package:care_nest/features/sign_up/ui/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            hintText: "First Name",
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: AppTextFormField(
                            hintText: "Last Name",
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const AppTextFormField(
                      hintText: "Email",
                    ),
                    const SizedBox(height: 16),
                    AppTextFormField(
                      hintText: "Password",
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: ColorsData.primaryBlueColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextFormField(
                      hintText: "Confirm Password",
                      obscureText: !_isConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: ColorsData.primaryBlueColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
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
