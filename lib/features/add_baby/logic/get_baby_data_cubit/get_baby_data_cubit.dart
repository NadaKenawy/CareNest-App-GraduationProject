import 'package:care_nest/features/add_baby/data/repos/get_baby_data_repo.dart';
import 'package:care_nest/features/add_baby/logic/get_baby_data_cubit/get_baby_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetBabyDataCubit extends Cubit<GetBabyDataState> {
  GetBabyDataCubit(this._getBabyDataRepo)
      : super(const GetBabyDataState.initial());
  final GetBabyDataRepo _getBabyDataRepo;

  void getBabyData() async {
    emit(const GetBabyDataState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getBabyDataRepo.getBabyData(token);

    response.when(
      success: (getBabyDataResponse) {
        if (getBabyDataResponse.babyData != null) {
          emit(GetBabyDataState.success(getBabyDataResponse.babyData!));
        } else {
          emit(const GetBabyDataState.error(error: 'No baby data available.'));
        }
      },
      failure: (error) {
        emit(GetBabyDataState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
