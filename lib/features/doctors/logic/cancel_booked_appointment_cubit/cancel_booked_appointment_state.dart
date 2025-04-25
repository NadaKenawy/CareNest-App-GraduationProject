import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'cancel_booked_appointment_state.freezed.dart';

@freezed
class CancelBookedAppointmentState with _$CancelBookedAppointmentState {
  const factory CancelBookedAppointmentState.initial() = _Initial;
  const factory CancelBookedAppointmentState.loading() = _Loading;
  const factory CancelBookedAppointmentState.success() = _Success;
  const factory CancelBookedAppointmentState.error(ApiErrorModel error) = _Error;
}
