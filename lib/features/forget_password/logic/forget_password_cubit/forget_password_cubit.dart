import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_email_request_body.dart';
import 'package:care_nest/features/forget_password/data/repos/forget_pass_repo.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPassRepo)
      : super(const ForgetPasswordState.initial());

  final ForgetPassRepo _forgetPassRepo;
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> loadSavedEmail() async {
    String? savedEmail =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);
    if (emailController.text.isEmpty) {
      emailController.text = savedEmail; // تحميل الإيميل المحفوظ
      log("Loaded Email: $savedEmail");
    }
  }

  void emitForgetPasswordStates() async {
    await loadSavedEmail();
    emit(const ForgetPasswordState.loading());

    final response = await _forgetPassRepo.forget(
      ForgetPassEmailRequestBody(email: emailController.text),
    );
    response.when(
      success: (forgetPassResponse) async {
        await saveUserToken(forgetPassResponse.token ?? '');

        await saveEmail();

        emit(ForgetPasswordState.success(forgetPassResponse));
      },
      failure: (apiErrorModel) {
        emit(ForgetPasswordState.error(apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log("Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}");
  }

  Future<void> saveEmail() async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userEmail, emailController.text);
    log("Saved Email: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail)}");
  }
}
