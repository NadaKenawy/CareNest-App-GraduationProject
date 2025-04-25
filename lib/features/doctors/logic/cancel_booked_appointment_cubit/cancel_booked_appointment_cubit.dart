import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../data/repos/cancel_booked_appointment_repo.dart';
import 'cancel_booked_appointment_state.dart';

class CancelBookedAppointmentCubit extends Cubit<CancelBookedAppointmentState> {
  final CancelBookedAppointmentRepo _repo;

  CancelBookedAppointmentCubit(this._repo)
      : super(const CancelBookedAppointmentState.initial());

  Future<void> cancelBookedAppointment(String appointmentId) async {
    emit(const CancelBookedAppointmentState.loading());
    try {
      final token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      final response =
          await _repo.cancelBookedAppointment(token, appointmentId);

      response.when(
        success: (_) {
          emit(const CancelBookedAppointmentState.success());
        },
        failure: (error) {
          if (error is ApiErrorModel) {
            emit(CancelBookedAppointmentState.error(error as ApiErrorModel));
          } else {
            emit(CancelBookedAppointmentState.error(
              ApiErrorModel(
                  message: 'An unexpected error occurred, please try again.'),
            ));
          }
        },
      );
    } catch (e) {
      emit(CancelBookedAppointmentState.error(
        ApiErrorModel(message: e.toString()),
      ));
    }
  }
}
