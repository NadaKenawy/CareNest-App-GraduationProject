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

  TextEditingController otpField1Controller = TextEditingController();
  TextEditingController otpField2Controller = TextEditingController();
  TextEditingController otpField3Controller = TextEditingController();
  TextEditingController otpField4Controller = TextEditingController();
  TextEditingController otpField5Controller = TextEditingController();
  TextEditingController otpField6Controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitVerifyPasswordStates() async {
    emit(const VerifyPasswordState.loading());

    String completeCode = otpField1Controller.text +
        otpField2Controller.text +
        otpField3Controller.text +
        otpField4Controller.text +
        otpField5Controller.text +
        otpField6Controller.text;

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _verifyPasswordRepo.forget(
      VerifyPasswordRequestBody(
        resetCode: completeCode,
      ),
      token,
    );
    response.when(
      success: (forgetPassResponse) async {
        emit(VerifyPasswordState.success(forgetPassResponse));
      },
      failure: (error) {
        emit(VerifyPasswordState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
