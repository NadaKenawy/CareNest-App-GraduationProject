// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/login/data/models/login_request_body.dart';
import 'package:care_nest/features/login/data/repos/login_repo.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token ?? '');
        emit(LoginState.success(loginResponse));
      },
      failure: (apiErrorModel) {
        emit(LoginState.error(apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log("Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}");
  }
}
