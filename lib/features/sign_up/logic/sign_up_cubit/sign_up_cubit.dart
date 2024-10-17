import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:care_nest/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void updateDateOfBirth(int? day, int? month, int? year) {
    if (day != null && month != null && year != null) {
      String formattedDate =
          "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
      dateOfBirthController.text = formattedDate;
    }
  }

  // تحميل البيانات المحفوظة من الـ SharedPreferences
  Future<void> loadSavedUserData() async {
    String? savedFirstName =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userFirstName);
    String? savedLastName =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userLastName);
    String? savedEmail =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);
    String? savedDateOfBirth =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userDateOfBirth);
    String? savedPassword =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userPassword);
    String? savedPasswordConfirm = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userPasswordConfirm);

    // تحميل البيانات في الـ controllers
    if (firstNameController.text.isEmpty && savedFirstName != null) {
      firstNameController.text = savedFirstName;
    }
    if (lastNameController.text.isEmpty && savedLastName != null) {
      lastNameController.text = savedLastName;
    }
    if (emailController.text.isEmpty && savedEmail != null) {
      emailController.text = savedEmail;
    }
    if (dateOfBirthController.text.isEmpty && savedDateOfBirth != null) {
      dateOfBirthController.text = savedDateOfBirth;
    }
    if (passwordController.text.isEmpty && savedPassword != null) {
      passwordController.text = savedPassword;
    }
    if (passwordConfirmController.text.isEmpty &&
        savedPasswordConfirm != null) {
      passwordConfirmController.text = savedPasswordConfirm;
    }

    log("Loaded Data: FirstName: $savedFirstName, LastName: $savedLastName, Email: $savedEmail, Password: $savedPassword, PasswordConfirm: $savedPasswordConfirm, Date of Birth: $savedDateOfBirth");
  }

  // دالة لاستدعاء sign up مع تحميل البيانات المحفوظة قبل التنفيذ
  void emitSignupStates() async {
    await loadSavedUserData(); // تحميل البيانات المحفوظة قبل تنفيذ أي شيء

    emit(const SignupState.loading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
        dateOfBirthOfMam: dateOfBirthController.text,
      ),
    );

    response.when(
      success: (signupResponse) async {
        await saveUserData(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirm: passwordConfirmController.text,
          dateOfBirth: dateOfBirthController.text,
        );
        await saveUserToken(signupResponse.token ?? '');
        emit(SignupState.success(signupResponse));
      },
      failure: (error) {
        log("Sign Error");
        emit(SignupState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }

  Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String dateOfBirth,
  }) async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userFirstName, firstName);
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userLastName, lastName);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userEmail, email);
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userPassword, password);
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userPasswordConfirm, passwordConfirm);
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userDateOfBirth, dateOfBirth);

    log("Saved Data: FirstName: $firstName, LastName: $lastName, Email: $email, Password: $password, PasswordConfirm: $passwordConfirm, Date of Birth: $dateOfBirth");
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log("Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}");
  }
}
