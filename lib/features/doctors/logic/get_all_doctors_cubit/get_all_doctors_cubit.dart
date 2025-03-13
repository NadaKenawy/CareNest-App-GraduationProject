import 'package:bloc/bloc.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors_request_body.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/repos/get_doctors_repo.dart';
import 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit(this._getDoctorsRepo)
      : super(const GetAllDoctorsState.initial());
  final GetDoctorsRepo _getDoctorsRepo;

  void getAllDoctors() async {
    emit(const GetAllDoctorsState.loading());
    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getDoctorsRepo.getDoctors(
        GetDoctorsRequestBody(
          longitude: 32.2937089,
          latitude: 30.6140389,
        ),
        token);
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
