import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/reminders/data/models/add_medication_schedule_request_body.dart';
import 'package:care_nest/features/reminders/data/repos/add_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/logic/add_medication_schedule_cubit/add_medication_schedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMedicationScheduleCubit extends Cubit<AddMedicationScheduleState> {
  AddMedicationScheduleCubit(this._medicationScheduleRepo)
      : super(const AddMedicationScheduleState.initial());

  final AddMedicationScheduleRepo _medicationScheduleRepo;
  TextEditingController medicationNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController beginController = TextEditingController();
  TextEditingController endController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void addMedicationSchedule(String babyId) async {
    log('Starting medication schedule operation for baby with id: $babyId');

    emit(const AddMedicationScheduleState.addMedicationScheduleLoading());

    try {
      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Authorization Token Retrieved: $token');

      final request = AddMedicationScheduleRequestBody(
        medicationName: medicationNameController.text,
        time: timeController.text,
        begin: beginController.text,
        end: endController.text,
      );

      final response = await _medicationScheduleRepo.addMedicationSchedule(
        request,
        babyId,
        token,
      );

      response.when(
        success: (medicationScheduleResponse) async {
          log('Medication Schedule Success: $medicationScheduleResponse');
          emit(AddMedicationScheduleState.addMedicationScheduleSuccess(
              medicationScheduleResponse));
        },
        failure: (error) {
          String errorMessage = error.toString();
          emit(AddMedicationScheduleState.addMedicationScheduleError(
              error: errorMessage));
          log('Error Occurred: $errorMessage');
        },
      );
    } catch (e) {
      log('Unexpected Error: $e');
      emit(AddMedicationScheduleState.addMedicationScheduleError(
          error: e.toString()));
    }
  }
}
