import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../data/models/update_pass_request_body.dart';
import '../data/repo/update_pass_repo.dart';
import 'update_pass_state.dart';

class UpdatePassCubit extends Cubit<UpdatePassState> {
  UpdatePassCubit(
    this._updatePassRepo,
  ) : super(const UpdatePassState.initial());
  final UpdatePassRepo _updatePassRepo;

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitUpdatePassStates() async {
    emit(const UpdatePassState.loading());
    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _updatePassRepo.updatePassword(
      UpdatePassRequestBody(
          oldPassword: oldPassController.text,
          newPassword: newPassController.text,
          confirmPassword: confirmPassController.text),
      token,
    );
    response.when(
      success: (updatePassResponse) async {
        await saveUserToken(updatePassResponse.token);

        emit(UpdatePassState.success(updatePassResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdatePassState.error(apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log(
      "Saved NewToken: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}",
    );
  }
}
