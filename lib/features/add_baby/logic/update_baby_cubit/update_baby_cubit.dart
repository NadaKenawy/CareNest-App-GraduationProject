import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby_request.dart';
import 'package:care_nest/features/add_baby/data/repos/update_baby_repo.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBabyCubit extends Cubit<UpdateBabyState> {
  UpdateBabyCubit(this._updateBabyRepo)
      : super(const UpdateBabyState.initial());
  final UpdateBabyRepo _updateBabyRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController dateOfBirthOfBabyController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitUpdateBabyState(String id) async {
    log('Starting update operation for baby with id: $id');

    emit(const UpdateBabyState.updateBabyLoading());

    try {
      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Authorization Token Retrieved: $token');

      final request = UpdateBabyRequest(
        id: id,
        name: nameController.text.isNotEmpty ? nameController.text : null,
        weight: weightController.text.isNotEmpty
            ? num.tryParse(weightController.text)
            : null,
        height: heightController.text.isNotEmpty
            ? num.tryParse(heightController.text)
            : null,
        dateOfBirthOfBaby: dateOfBirthOfBabyController.text.isNotEmpty
            ? dateOfBirthOfBabyController.text
            : null,
        gender: genderController.text.isNotEmpty ? genderController.text : null,
      );

      final response = await _updateBabyRepo.updateBaby(request, token);

      response.when(
        success: (updateBabyResponse) async {
          log('Update Baby Success: $updateBabyResponse');
          emit(UpdateBabyState.updateBabySuccess(updateBabyResponse));
        },
        failure: (error) {
          String errorMessage = error.signUpErrorModel?.errors?.first.msg ??
              'Unknown error occurred';
          emit(UpdateBabyState.updateBabyError(error: errorMessage));
          log('Error Occurred: $errorMessage');
        },
      );
    } catch (e) {
      log('Unexpected Error: $e');
      emit(UpdateBabyState.updateBabyError(error: e.toString()));
    }
  }
}
