import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/add_baby/data/repos/delete_baby_repo.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_state.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBabyCubit extends Cubit<DeleteBabyState> {
  DeleteBabyCubit(this._deleteBabyRepo)
      : super(const DeleteBabyState.initial());

  final DeleteBabyRepo _deleteBabyRepo;

  void deleteBaby(String babyId, BuildContext context) async {
    emit(const DeleteBabyState.deleteBabyLoading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _deleteBabyRepo.deleteBaby(token, babyId);

    response.when(
      success: (responseMessage) async {
        log('Success: $responseMessage');

        emit(const DeleteBabyState.deleteBabySuccess());
        context.read<GetAllBabiesCubit>().getAllBabies();
      },
      failure: (error) {
        String errorMessage = 'Unknown error occurred';

        if (error.signUpErrorModel.errors != null &&
            error.signUpErrorModel.errors!.isNotEmpty) {
          errorMessage =
              error.signUpErrorModel.errors!.first.msg ?? errorMessage;
        }

        emit(DeleteBabyState.deleteBabyError(error: errorMessage));
        log('Error: $errorMessage');
      },
    );
  }
}
