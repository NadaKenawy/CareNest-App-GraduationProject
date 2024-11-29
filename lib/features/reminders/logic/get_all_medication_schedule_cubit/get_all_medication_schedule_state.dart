import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/get_all_medication_schedule_response.dart';
part 'get_all_medication_schedule_state.freezed.dart';

@freezed
class GetAllMedicationScheduleState<T> with _$GetAllMedicationScheduleState<T> {
  const factory GetAllMedicationScheduleState.initial() = _Initial;
  const factory GetAllMedicationScheduleState.loading() = Loading;
  const factory GetAllMedicationScheduleState.success(
      List<MedicationData>? medicationData) = Success;
  const factory GetAllMedicationScheduleState.error(
      ApiErrorModel apiErrorModel) = Error;
}
