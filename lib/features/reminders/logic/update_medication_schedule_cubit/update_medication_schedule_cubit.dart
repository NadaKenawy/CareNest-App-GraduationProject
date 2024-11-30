import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/reminders/data/models/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/data/models/update_medication_schedule_request.dart';
import 'package:care_nest/features/reminders/data/repos/update_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/logic/update_medication_schedule_cubit/update_medication_schedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMedicationScheduleCubit
    extends Cubit<UpdateMedicationScheduleState> {
  UpdateMedicationScheduleCubit(this._repository, this.medicinesData)
      : super(const UpdateMedicationScheduleState.initial());

  final UpdateMedicationScheduleRepo _repository;
  final MedicationData medicinesData;
  TextEditingController medicationNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController beginController = TextEditingController();
  TextEditingController endController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitUpdateMedicationScheduleState(
      String babyId, String scheduleId) async {
    log('Starting update operation for schedule: $scheduleId of baby: $babyId');

    emit(const UpdateMedicationScheduleState.updateMedicationLoading());

    try {
      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Authorization Token Retrieved: $token');

      final request = UpdateMedicationScheduleRequest(
        medicationName: medicationNameController.text.isNotEmpty
            ? medicationNameController.text
            : medicinesData.medicationName,
        time: timeController.text.isNotEmpty
            ? timeController.text
            : medicinesData.time.toString(),
        begin: beginController.text.isNotEmpty
            ? beginController.text
            : medicinesData.begin.toString(),
        end: endController.text.isNotEmpty
            ? endController.text
            : medicinesData.end.toString(),
      );

      final response = await _repository.updateMedicationSchedule(
        babyId: babyId,
        scheduleId: scheduleId,
        token: token,
        request: request,
      );

      response.when(
        success: (updateMedicationResponse) {
          log('Update Medication Schedule Success: $updateMedicationResponse');
          emit(UpdateMedicationScheduleState.updateMedicationSuccess(
              updateMedicationResponse));
        },
        failure: (error) {
          String errorMessage = error.signUpErrorModel.errors?.first.msg ??
              'Unknown error occurred';
          log('Error Occurred: $errorMessage');
          emit(UpdateMedicationScheduleState.updateMedicationError(
              error: errorMessage));
        },
      );
    } catch (e) {
      log('Unexpected Error: $e');
      emit(UpdateMedicationScheduleState.updateMedicationError(
          error: e.toString()));
    }
  }
}
