import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/repos/verify_password_repo.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPasswordCubit extends Cubit<VerifyPasswordState> {
  VerifyPasswordCubit(this._verifyPasswordRepo)
      : super(const VerifyPasswordState.initial());
  final VerifyPasswordRepo _verifyPasswordRepo;

  TextEditingController otpField = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitVerifyPasswordStates() async {
    emit(const VerifyPasswordState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _verifyPasswordRepo.forget(
      VerifyPasswordRequestBody(
        resetCode: otpField.text,
      ),
      token,
    );
    response.when(
      success: (verifyPasswordResponse) async {
        emit(VerifyPasswordState.success(verifyPasswordResponse));
      },
      failure: (apiErrorModel) {
        emit(VerifyPasswordState.error(apiErrorModel));
      },
    );
  }
}
