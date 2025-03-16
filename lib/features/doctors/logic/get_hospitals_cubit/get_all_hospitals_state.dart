import 'package:care_nest/features/doctors/data/models/get_hospitals/get_hospitals_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'get_all_hospitals_state.freezed.dart';

@freezed
class GetAllHospitalsState<T> with _$GetAllHospitalsState<T> {
  const factory GetAllHospitalsState.initial() = _Initial;
  const factory GetAllHospitalsState.loading() = Loading;
  const factory GetAllHospitalsState.success(List<HospitalData>? hospitalsData) = Success<T>;
  const factory GetAllHospitalsState.error(ApiErrorModel apiErrorModel) = Error;
}
