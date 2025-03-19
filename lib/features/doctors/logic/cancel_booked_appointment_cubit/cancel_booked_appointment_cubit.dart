import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/doctors/data/repos/cancel_booked_appointment_repo.dart';
import 'package:care_nest/features/doctors/logic/cancel_booked_appointment_cubit/cancel_booked_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';

class CancelBookedAppointmentCubit extends Cubit<CancelBookedAppointmentState> {
  final CancelBookedAppointmentRepo _cancelBookedAppointmentRepo;

  CancelBookedAppointmentCubit(this._cancelBookedAppointmentRepo)
      : super(const CancelBookedAppointmentState.initial());

  Future<void> cancelBookedAppointment(String id) async {
    emit(const CancelBookedAppointmentState.loading());
    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _cancelBookedAppointmentRepo.cancelBookedAppointment(
      token,
      id,
    );
    response.when(
      success: (cancelResponse) {
        emit(CancelBookedAppointmentState.success(cancelResponse.data));
      },
      failure: (apiErrorModel) {
        emit(
            CancelBookedAppointmentState.error(apiErrorModel as ApiErrorModel));
      },
    );
  }
}
