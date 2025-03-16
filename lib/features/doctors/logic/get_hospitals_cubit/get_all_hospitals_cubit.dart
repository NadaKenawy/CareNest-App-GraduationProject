import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/repos/get_hospitals_repo.dart';
import '../../service/location_service.dart';
import 'get_all_hospitals_state.dart';

class GetAllHospitalsCubit extends Cubit<GetAllHospitalsState> {
  final GetHospitalsRepo _getHospitalsRepo;

  GetAllHospitalsCubit(this._getHospitalsRepo)
      : super(const GetAllHospitalsState.initial());

  void getAllHospitals() async {
    emit(const GetAllHospitalsState.loading());

    await LocationService.getCurrentLocation();
    if (LocationService.currentPosition == null) {
      log('Location service is disabled');
      return;
    }

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getHospitalsRepo.getHospitals(
      LocationService.currentPosition!.longitude,
      LocationService.currentPosition!.latitude,
      token,
    );

    response.when(
      success: (getHospitalsResponse) {
        emit(GetAllHospitalsState.success(getHospitalsResponse.data));
      },
      failure: (apiErrorModel) {
        emit(GetAllHospitalsState.error(apiErrorModel));
      },
    );
  }
}
