import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'doctor_booking_state.freezed.dart';

@freezed
class DoctorBookingState<T> with _$DoctorBookingState<T> {
  const factory DoctorBookingState.initial() = _Initial;
  const factory DoctorBookingState.bookingLoading() = BookingLoading;
  const factory DoctorBookingState.bookingSuccess(T data) = BookingSuccess<T>;
  const factory DoctorBookingState.bookingError(ApiErrorModel apiErrorModel) = BookingError;
}
