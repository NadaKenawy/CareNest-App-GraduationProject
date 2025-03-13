import 'package:care_nest/features/doctors/data/models/get_doctors_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
part 'get_all_doctors_state.freezed.dart';

@freezed
class GetAllDoctorsState<T> with _$GetAllDoctorsState<T> {
  const factory GetAllDoctorsState.initial() = _Initial;
  const factory GetAllDoctorsState.loading() = Loading;
  const factory GetAllDoctorsState.success(List<DoctorData>? doctorsData) =
      Success<T>;
  const factory GetAllDoctorsState.error(ApiErrorModel apiErrorModel) = Error;
}
