import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/doctors/data/models/booked_appointments/get_booked_appointments_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_booked_appointments_state.freezed.dart';

@freezed
class GetBookedAppointmentsState with _$GetBookedAppointmentsState {
  const factory GetBookedAppointmentsState.initial() = _Initial;
  const factory GetBookedAppointmentsState.loading() = _Loading;
  const factory GetBookedAppointmentsState.success(List<BookedAppointmentData>? appointments) = _Success;
  const factory GetBookedAppointmentsState.error(ApiErrorModel apiErrorModel) = _Error;
}
