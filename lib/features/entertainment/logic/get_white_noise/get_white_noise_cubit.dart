import 'package:bloc/bloc.dart';
import 'package:care_nest/features/entertainment/data/repos/get_white_noise_repo.dart';
import 'package:care_nest/features/entertainment/logic/get_white_noise/get_white_noise_state.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetWhiteNoiseCubit extends Cubit<GetWhiteNoiseState> {
  GetWhiteNoiseCubit(this._getWhiteNoiseRepo)
      : super(const GetWhiteNoiseState.initial());
  final GetWhiteNoiseRepo _getWhiteNoiseRepo;

  void getWhiteNoise() async {
    emit(const GetWhiteNoiseState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getWhiteNoiseRepo.getWhiteNoise(token);

    response.when(success: (getWhiteNoiseResponse) {
      emit(GetWhiteNoiseState.success(getWhiteNoiseResponse.data));
    }, failure: (error) {
      emit(GetWhiteNoiseState.error(error));
    });
  }
}
