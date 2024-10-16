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

  void emitForgetPasswordStates() async {
    emit(const ForgetPasswordState.loading());
    final response = await _forgetPassRepo.forget(
      ForgetPassEmailRequestBody(
        email: emailController.text,
      ),
    );
    response.when(
      success: (forgetPassResponse) async {
        await saveUserToken(forgetPassResponse.token ?? '');
        emit(ForgetPasswordState.success(forgetPassResponse));
      },
      failure: (error) {
        final errorMessage = error.apiErrorModel.errors?.isNotEmpty == true
            ? error.apiErrorModel.errors![0].msg
            : 'Invalid email';
        emit(ForgetPasswordState.error(error: errorMessage ?? 'Unknown error'));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log("Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}");
  }
}
