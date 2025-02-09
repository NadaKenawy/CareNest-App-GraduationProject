import 'dart:developer';

import 'package:care_nest/features/add_baby/data/repos/get_all_babies_repo.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetAllBabiesCubit extends Cubit<GetAllBabiesState> {
  GetAllBabiesCubit(this._getAllBabiesRepo)
      : super(const GetAllBabiesState.initial());
  final GetAllBabiesRepo _getAllBabiesRepo;

  void getAllBabies() async {
    emit(const GetAllBabiesState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getAllBabiesRepo.getAllBabies(token);

    response.when(
      success: (getAllBabiesResponse) {
        SharedPrefHelper.setData(
            SharedPrefKeys.babyId, getAllBabiesResponse.babiesData!.first.id);
        log('babyId: ${getAllBabiesResponse.babiesData!.first.id}');
        emit(GetAllBabiesState.success(getAllBabiesResponse.babiesData));
      },
      failure: (error) {
        emit(GetAllBabiesState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
