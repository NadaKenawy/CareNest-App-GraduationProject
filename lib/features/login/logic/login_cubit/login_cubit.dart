import 'package:bloc/bloc.dart';
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
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        final errorMessage = error.apiErrorModel.errors?.isNotEmpty == true
            ? error.apiErrorModel.errors![0].msg
            : 'Invalid email or password';

        emit(LoginState.error(error: errorMessage ?? 'Unknown error'));
      },
    );
  }
}
