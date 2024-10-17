import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_request_body.dart';
import 'package:care_nest/features/sign_up/data/repos/verify_account_repo.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit(this._verifyPasswordRepo)
      : super(const VerifyAccountState.initial());
  final VerifyAccountRepo _verifyPasswordRepo;

  TextEditingController otpField1Controller = TextEditingController();
  TextEditingController otpField2Controller = TextEditingController();
  TextEditingController otpField3Controller = TextEditingController();
  TextEditingController otpField4Controller = TextEditingController();
  TextEditingController otpField5Controller = TextEditingController();
  TextEditingController otpField6Controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitVerifyAccountStates() async {
    emit(const VerifyAccountState.loading());

    String completeCode = otpField1Controller.text +
        otpField2Controller.text +
        otpField3Controller.text +
        otpField4Controller.text +
        otpField5Controller.text +
        otpField6Controller.text;

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _verifyPasswordRepo.forget(
      VerifyAccountRequestBody(
        code: completeCode,
      ),
      token,
    );
    response.when(
      success: (signupResponse) async {
        emit(VerifyAccountState.success(signupResponse));
      },
      failure: (error) {
        emit(VerifyAccountState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
