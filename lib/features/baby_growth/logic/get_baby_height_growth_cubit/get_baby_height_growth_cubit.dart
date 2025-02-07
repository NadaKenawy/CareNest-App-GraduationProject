import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_height_growth_repo.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'get_baby_height_growth_state.dart';

class GetBabyHeightGrowthCubit extends Cubit<GetBabyHeightGrowthState> {
  GetBabyHeightGrowthCubit(this._getBabyHeightGrowthRepo)
      : super(const GetBabyHeightGrowthState.initial());

  final GetBabyHeightGrowthRepo _getBabyHeightGrowthRepo;

  void getBabyHeightGrowth(String babyid) async {
    emit(const GetBabyHeightGrowthState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response =
        await _getBabyHeightGrowthRepo.getBabyHeightGrowth(token, babyid);
    if (isClosed) return;

    response.when(
      success: (getBabyGrowthResponse) {
        log('Decoded Data: ${getBabyGrowthResponse.data}');
        emit(
          GetBabyHeightGrowthState.success(
              getBabyGrowthResponse.data!.height ?? []),
        );
      },
      failure: (apiErrorModel) {
        log('API Failure: ${apiErrorModel.message}');
        emit(GetBabyHeightGrowthState.error(apiErrorModel));
      },
    );
  }
}
