import 'package:bloc/bloc.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_growth_repo.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'get_baby_growth_cubit_state.dart';

class GetBabyGrowthHeightCubit extends Cubit<GetBabyGrowthHeightCubitState> {
  GetBabyGrowthHeightCubit(this._getBabyGrowthRepo)
      : super(const GetBabyGrowthHeightCubitState.initial());

  final GetBabyGrowthHeightRepo _getBabyGrowthRepo;

  void getBabyGrowth(String babyid) async {
    emit(const GetBabyGrowthHeightCubitState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response =
        await _getBabyGrowthRepo.getBabyGrowthHeight(token, babyid);
    if (isClosed) return;

    response.when(
      success: (getBabyGrowthResponse) {
        emit(
          GetBabyGrowthHeightCubitState.success(getBabyGrowthResponse.height),
        );
      },
      failure: (apiErrorModel) {
        emit(GetBabyGrowthHeightCubitState.error(apiErrorModel));
      },
    );
  }
}
