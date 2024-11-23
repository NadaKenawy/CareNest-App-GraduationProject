import 'dart:developer';
import 'package:care_nest/features/add_baby/data/repos/delete_baby_repo.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'delete_baby_state.dart';

class DeleteBabyCubit extends Cubit<DeleteBabyState> {
  DeleteBabyCubit(this._deleteBabyRepo)
      : super(const DeleteBabyState.initial());

  final DeleteBabyRepo _deleteBabyRepo;

  void deleteBaby(String id, BuildContext context) async {
    log('Starting delete operation for baby with id: $id');

    emit(const DeleteBabyState.deleteBabyLoading());

    try {
      String token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      log('Authorization Token Retrieved: $token');

      final response = await _deleteBabyRepo.deleteBaby(token, id);

      response.when(
        success: (responseMessage) async {
          log('Delete Baby Success: $responseMessage');
          emit(const DeleteBabyState.deleteBabySuccess());
          context.read<GetAllBabiesCubit>().getAllBabies();
        },
        failure: (error) {
          String errorMessage = error.signUpErrorModel.errors?.first.msg ??
              'Unknown error occurred';

          emit(DeleteBabyState.deleteBabyError(error: errorMessage));
          log('Error Occurred: $errorMessage');
        },
      );
    } catch (e) {
      log('Unexpected Error: $e');
      emit(DeleteBabyState.deleteBabyError(error: e.toString()));
    }
  }
}
