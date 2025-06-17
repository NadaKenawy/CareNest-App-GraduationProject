import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/create_report/create_report_request_body.dart';
import '../../data/repos/create_report_repo.dart';
import 'create_report_state.dart';

class CreateReportCubit extends Cubit<CreateReportState> {
  CreateReportCubit(this._createReportRepo)
      : super(const CreateReportState.initial());

  final CreateReportRepo _createReportRepo;

  TextEditingController review = TextEditingController();

  void emitCreateReportStates(dynamic ratings, String userId) async {
    emit(const CreateReportState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    final response = await _createReportRepo.createReport(
      CreateReportRequestBody(
        title: review.text,
        ratings: ratings,
        userId: userId,
      ),
      token,
    );
    response.when(
      success: (createReportResponse) async {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.reportId,
          createReportResponse.data.id,
        );
        log(
          "Saved ReportId: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.reportId)}",
        );
        emit(CreateReportState.success(createReportResponse));
      },
      failure: (apiErrorModel) {
        emit(CreateReportState.error(apiErrorModel));
      },
    );
  }
}
