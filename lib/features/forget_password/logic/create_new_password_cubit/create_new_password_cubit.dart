import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/forget_password/data/models/create_new_password_model/create_new_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/repos/create_new_password.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordCubit extends Cubit<CreatePasswordState> {
  CreateNewPasswordCubit(this._createNewPasswordRepo)
      : super(const CreatePasswordState.initial());

  final CreateNewPasswordRepo _createNewPasswordRepo;

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> emitCreateNewPasswordStates() async {
    emit(const CreatePasswordState.createNewPasswordloading());

    // Fetch the token from shared preferences
    String? token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    // Create password change request
    final response = await _createNewPasswordRepo.createNewPassword(
      CreateNewPasswordRequestBody(
        newPassword: newPasswordController.text,
        passwordConfirm: passwordConfirmController.text,
      ),
      token,
    );

    response.when(
      success: (_) {
        emit(const CreatePasswordState.createNewPasswordsuccess(
            message: 'Password created successfully!'));
      },
      failure: (apiErrorModel) {
        emit(CreatePasswordState.createNewPassworderror(apiErrorModel));
      },
    );
  }
}
