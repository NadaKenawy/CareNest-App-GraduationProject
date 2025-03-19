import 'package:care_nest/features/doctors/data/models/cancel_booked_appointment/cancel_booked_appointment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_nest/core/networking/api_error_model.dart';

part 'cancel_booked_appointment_state.freezed.dart';

@freezed
class CancelBookedAppointmentState with _$CancelBookedAppointmentState {
  const factory CancelBookedAppointmentState.initial() = _Initial;
  const factory CancelBookedAppointmentState.loading() = _Loading;
  const factory CancelBookedAppointmentState.success(CancelBookedAppointmentData data) = _Success;
  const factory CancelBookedAppointmentState.error(ApiErrorModel apiErrorModel) = _Error;
}
