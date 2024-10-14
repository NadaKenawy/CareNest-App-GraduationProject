// import 'package:care_nest/core/routing/app_router.dart';
// import 'package:care_nest/core/theme/colors_manager.dart';
// import 'package:care_nest/core/widgets/custom_button.dart';
// import 'package:care_nest/core/widgets/custom_text_form_field.dart';
// import 'package:care_nest/features/sign_up/ui/widgets/alternativeaction_whenhaveaccount.dart';
// import 'package:care_nest/features/sign_up/ui/widgets/date_of_birth_field%20.dart';
// import 'package:care_nest/features/sign_up/ui/widgets/first_and_last_name_fields.dart';
// import 'package:care_nest/features/sign_up/ui/widgets/password_field.dart';
// import 'package:care_nest/features/sign_up/ui/widgets/sign_up_image.dart';
// import 'package:care_nest/features/sign_up/ui/widgets/sign_up_title.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class SignUpScreenBody extends StatefulWidget {
//   const SignUpScreenBody({super.key});

//   @override
//   State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
// }

// class _SignUpScreenBodyState extends State<SignUpScreenBody> {
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   void _onDaySelected(int? value) {}

//   void _onMonthSelected(int? value) {}

//   void _onYearSelected(int? value) {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             const SignUpImage(),
//             Padding(
//               padding: EdgeInsets.only(top: 350.h),
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(70),
//                     topRight: Radius.circular(70),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const SignUpTitle(),
//                     SizedBox(height: 24.h),
//                     const FirstAndLastNameFields(),
//                     SizedBox(height: 16.h),
//                     const AppTextFormField(
//                       hintText: "Email",
//                     ),
//                     SizedBox(height: 16.h),
//                     PasswordField(
//                       hintText: "Password",
//                       obscureText: !_isPasswordVisible,
//                       onVisibilityToggle: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                       isVisible: _isPasswordVisible,
//                     ),
//                     SizedBox(height: 16.h),
//                     PasswordField(
//                       hintText: "Confirm Password",
//                       obscureText: !_isConfirmPasswordVisible,
//                       onVisibilityToggle: () {
//                         setState(() {
//                           _isConfirmPasswordVisible =
//                               !_isConfirmPasswordVisible;
//                         });
//                       },
//                       isVisible: _isConfirmPasswordVisible,
//                     ),
//                     SizedBox(height: 16.h),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date Of Birth",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: ColorsManager.primaryBlueColor,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     DateOfBirthDropdowns(
//                       onDaySelected: _onDaySelected,
//                       onMonthSelected: _onMonthSelected,
//                       onYearSelected: _onYearSelected,
//                     ),
//                     SizedBox(
//                       height: 16.h,
//                     ),
//                     AppTextButton(
//                       buttonText: "Sign Up",
//                       onPressed: () {},
//                       textStyle: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                       backgroundColor: ColorsManager.primaryPinkColor,
//                       buttonHeight: 50.h,
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     AlternativeActionWhenHaveAccount(
//                       onTap: () {
//                         GoRouter.of(context).push(AppRouter.kloginScreen);
//                       },
//                       textLabel: "Aleardy have an account?",
//                       textButtonLabel: "Log In",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
