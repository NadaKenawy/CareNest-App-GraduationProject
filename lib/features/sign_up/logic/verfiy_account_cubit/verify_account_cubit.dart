import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_request_body.dart';
import 'package:care_nest/features/sign_up/data/repos/verify_account_repo.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit(this._verifyAccountRepo)
      : super(const VerifyAccountState.initial());
  final VerifyAccountRepo _verifyAccountRepo;

  final formKey = GlobalKey<FormState>();
  TextEditingController otpField = TextEditingController();

  void emitVerifyAccountStates() async {
    emit(const VerifyAccountState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    log("JWT Token: $token");
    final response = await _verifyAccountRepo.verify(
      VerifyAccountRequestBody(code: otpField.text),
      token,
    );
    response.when(
      success: (verifyAccountResponse) async {
        emit(VerifyAccountState.success(verifyAccountResponse));
      },
      failure: (apiErrorModel) {
        emit(VerifyAccountState.error(apiErrorModel));
      },
    );
  }
}
