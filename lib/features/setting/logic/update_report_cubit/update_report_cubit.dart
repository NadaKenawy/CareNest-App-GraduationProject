import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/update_report/update_report_request_body.dart';
import '../../data/repos/update_report_repo.dart';
import 'update_report_state.dart';

class UpdateReportCubit extends Cubit<UpdateReportState> {
  UpdateReportCubit(this._updateReportRepo)
      : super(const UpdateReportState.initial());
  final UpdateReportRepo _updateReportRepo;

  TextEditingController review = TextEditingController();

  void emitUpdateReportStates(dynamic ratings) async {
    emit(const UpdateReportState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
   
    final response = await _updateReportRepo.updateReport(
      UpdateReportRequestBody(title: review.text, ratings: ratings),
      token,
    );
    response.when(
      success: (updateReportResponse) {
        emit(UpdateReportState.success(updateReportResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdateReportState.error(apiErrorModel));
      },
    );
  }
}
