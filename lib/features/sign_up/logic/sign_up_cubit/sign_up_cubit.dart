// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_request_body.dart';
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
    emit(const SignupState.signupLoading());

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
    response.when(success: (signupResponse) async {
      await saveUserToken(signupResponse.token ?? '');
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      final errorMessage = error.apiErrorModel.errors?.isNotEmpty == true
          ? error.apiErrorModel.errors![0].msg
          : 'Unexpected error';

      emit(SignupState.signupError(error: errorMessage ?? 'Unknown error'));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log("Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}");
  }
}
