import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/get_all_babies_medication_schedule/get_all_babies_medication_schedule_response.dart';

part 'get_all_babies_medication_schedule_state.freezed.dart';

@freezed
class GetAllBabiesMedicationScheduleState<T> with _$GetAllBabiesMedicationScheduleState<T> {
  const factory GetAllBabiesMedicationScheduleState.initial() = _Initial;
  const factory GetAllBabiesMedicationScheduleState.loading() = Loading;
  const factory GetAllBabiesMedicationScheduleState.success(
      List<MedicationData>? medicationData) = Success;
  const factory GetAllBabiesMedicationScheduleState.error(
      ApiErrorModel apiErrorModel) = Error;
}
