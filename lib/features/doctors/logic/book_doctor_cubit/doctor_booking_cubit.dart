import 'dart:developer';
import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/doctors/data/models/book_doctor/book_doctor_request_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/repos/doctor_booking_repo.dart';
import 'doctor_booking_state.dart';

class DoctorBookingCubit extends Cubit<DoctorBookingState> {
  DoctorBookingCubit(this._doctorBookingRepo)
      : super(const DoctorBookingState.initial());

  final DoctorBookingRepo _doctorBookingRepo;

  Future<void> bookDoctorAppointment({
    required String doctorId,
    required String appointmentDateTime,
    String? promoCode,
  }) async {
    emit(const DoctorBookingState.bookingLoading());

    try {
      final token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

      final response = await _doctorBookingRepo.bookDoctorAppointment(
        BookDoctorRequestBody(
          promocode: promoCode,
          doctor: doctorId,
          appointmentDateTime: appointmentDateTime,
        ),
        token,
      );

      response.when(
        success: (bookingResponse) {
          emit(DoctorBookingState.bookingSuccess(bookingResponse));
        },
        failure: (apiErrorModel) {
          log(apiErrorModel.toString());
          emit(DoctorBookingState.bookingError(apiErrorModel as ApiErrorModel));
        },
      );
    } catch (e) {
      log("Unexpected error: $e");
      emit(DoctorBookingState.bookingError(
        ApiErrorModel(
            message: 'an unexpected error occurred, please try again.'),
      ));
    }
  }
}
