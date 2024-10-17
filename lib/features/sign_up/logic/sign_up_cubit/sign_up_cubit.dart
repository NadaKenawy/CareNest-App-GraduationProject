import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:care_nest/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';

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

  void emitSignupStates() async {
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
    emit(const SignupState.loading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        firstName: savedFirstName != null && savedFirstName.isNotEmpty
            ? savedFirstName
            : firstNameController.text,
        lastName: savedLastName != null && savedLastName.isNotEmpty
            ? savedLastName
            : lastNameController.text,
        email: savedEmail != null && savedEmail.isNotEmpty
            ? savedEmail
            : emailController.text,
        password: savedPassword != null && savedPassword.isNotEmpty
            ? savedPassword
            : passwordController.text,
        passwordConfirm:
            savedPasswordConfirm != null && savedPasswordConfirm.isNotEmpty
                ? savedPasswordConfirm
                : passwordConfirmController.text,
        dateOfBirthOfMam:
            savedDateOfBirth != null && savedDateOfBirth.isNotEmpty
                ? savedDateOfBirth
                : dateOfBirthController.text,
      ),
    );

    response.when(
      success: (signupResponse) async {
        if (savedFirstName == null ||
            savedFirstName.isEmpty ||
            savedLastName == null ||
            savedLastName.isEmpty ||
            savedEmail == null ||
            savedEmail.isEmpty ||
            savedPassword == null ||
            savedPassword.isEmpty ||
            savedPasswordConfirm == null ||
            savedPasswordConfirm.isEmpty ||
            savedDateOfBirth == null ||
            savedDateOfBirth.isEmpty) {
          await saveUserData(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
            passwordConfirm: passwordConfirmController.text,
            dateOfBirth: dateOfBirthController.text,
          );
        }

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
