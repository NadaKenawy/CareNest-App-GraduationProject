import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_request.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_response.dart';
import 'package:care_nest/features/baby_growth/data/repos/put_growth_data_repo.dart';
import 'package:care_nest/features/baby_growth/logic/put_growth_data_cubit/put_growth_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PutGrowthDataCubit extends Cubit<PutGrowthDataState> {
  PutGrowthDataCubit(this._putGrowthDataRepo, this.babyData)
      : super(const PutGrowthDataState.initial());

  final PutGrowthDataRepo _putGrowthDataRepo;
  final BabyData babyData;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitPutGrowthDataState(String id) async {
    log('Starting update operation for baby with id: $id');

    emit(const PutGrowthDataState.putGrowthDataLoading());

    try {
      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Authorization Token Retrieved: $token');

      double? updatedWeight = weightController.text.isNotEmpty
          ? double.tryParse(weightController.text)
          : null;

      double? updatedHeight = heightController.text.isNotEmpty
          ? double.tryParse(heightController.text)
          : null;

      final request = PutGrowthDataRequest(
        heightEntry: updatedHeight ?? babyData.height?.last.height,
        weightEntry: updatedWeight ?? babyData.weight?.last.weight,
      );

      final response = await _putGrowthDataRepo.putGrowthData(
        request,
        token,
        id,
      );

      response.when(
        success: (putGrowthDataResponse) async {
          log('Update Baby Data Success: $putGrowthDataResponse');
          emit(PutGrowthDataState.putGrowthDataSuccess(putGrowthDataResponse));
        },
        failure: (error) {
          String errorMessage = error.signUpErrorModel.errors?.first.msg ??
              'Unknown error occurred';
          emit(PutGrowthDataState.putGrowthDataError(error: errorMessage));
          log('Error Occurred: $errorMessage');
        },
      );
    } catch (e) {
      log('Unexpected Error: $e');
      emit(PutGrowthDataState.putGrowthDataError(error: e.toString()));
    }
  }
}
