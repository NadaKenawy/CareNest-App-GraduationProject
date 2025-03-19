import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/constants.dart';
import '../../data/repos/get_booked_appointments_repo.dart';
import 'get_booked_appointments_state.dart';

class GetBookedAppointmentsCubit extends Cubit<GetBookedAppointmentsState> {
  final GetBookedAppointmentsRepo _getBookedAppointmentsRepo;

  GetBookedAppointmentsCubit(this._getBookedAppointmentsRepo)
      : super(const GetBookedAppointmentsState.initial());

  Future<void> getBookedAppointments() async {
    emit(const GetBookedAppointmentsState.loading());
    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response =
        await _getBookedAppointmentsRepo.getBookedAppointments(token);
    response.when(
      success: (getBookedAppointmentsResponse) {
        emit(GetBookedAppointmentsState.success(
            getBookedAppointmentsResponse.data));
      },
      failure: (apiErrorModel) {
        emit(GetBookedAppointmentsState.error(apiErrorModel));
      },
    );
  }
}
