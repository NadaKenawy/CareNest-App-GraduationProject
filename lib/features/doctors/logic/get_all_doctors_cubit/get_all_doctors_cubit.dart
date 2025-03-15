import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/repos/get_doctors_repo.dart';
import '../../service/location_service.dart';
import 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit(this._getDoctorsRepo)
      : super(const GetAllDoctorsState.initial());
  final GetDoctorsRepo _getDoctorsRepo;

  void getAllDoctors() async {
    emit(const GetAllDoctorsState.loading());

    await LocationService.getCurrentLocation();
    if (LocationService.currentPosition == null) {
      log('Location service is disabled');
      return;
    }
    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getDoctorsRepo.getDoctors(
      LocationService.currentPosition!.longitude,
      LocationService.currentPosition!.latitude,
      token,
    );
    response.when(
      success: (getDoctorsResponse) {
        emit(GetAllDoctorsState.success(getDoctorsResponse.data));
      },
      failure: (apiErrorModel) {
        emit(GetAllDoctorsState.error(apiErrorModel));
      },
    );
  }
}
