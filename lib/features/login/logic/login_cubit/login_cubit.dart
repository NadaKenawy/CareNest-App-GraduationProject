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
    if (formKey.currentState!.validate()) {
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
    } else {
      emit(const LoginState.error(
          error: 'Please fill out all fields correctly'));
    }
  }
}

class LoginForm extends StatelessWidget {
  final LoginCubit loginCubit;

  const LoginForm({super.key, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: loginCubit.emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: loginCubit.passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              loginCubit.emitLoginStates();
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
