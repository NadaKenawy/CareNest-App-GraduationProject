import 'dart:developer';
import 'package:care_nest/features/reminders/data/repos/delete_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/logic/delete_medication_schedule_cubit/delete_medication_schedule_state.dart';
import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class DeleteMedicationScheduleCubit
    extends Cubit<DeleteMedicationScheduleState> {
  DeleteMedicationScheduleCubit(this._deleteMedicationScheduleRepo)
      : super(const DeleteMedicationScheduleState.initial());

  final DeleteMedicationScheduleRepo _deleteMedicationScheduleRepo;

  void deleteMedicationSchedule(
      String babyId, scheduleId, BuildContext context) async {
    log('Starting delete operation for Medication  schedule: $scheduleId of baby: $babyId');

    emit(const DeleteMedicationScheduleState.deleteMedicationScheduleLoading());

    try {
      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Authorization Token Retrieved: $token');

      final response = await _deleteMedicationScheduleRepo
          .deleteMedicationSchedule(token, babyId, scheduleId);

      response.when(
        success: (responseMessage) async {
          log('Delete Medication Schedule Success: $responseMessage');
          emit(const DeleteMedicationScheduleState
              .deleteMedicationScheduleSuccess());
          context
              .read<GetAllMedicationScheduleCubit>()
              .getAllMedicationSchedule(babyId);
        },
        failure: (error) {
          String errorMessage = error.signUpErrorModel.errors?.first.msg ??
              'Unknown error occurred';

          emit(DeleteMedicationScheduleState.deleteMedicationScheduleError(
              error: errorMessage));
          log('Error Occurred: $errorMessage');
        },
      );
    } catch (e) {
      log('Unexpected Error: $e');
      emit(DeleteMedicationScheduleState.deleteMedicationScheduleError(
          error: e.toString()));
    }
  }
}
