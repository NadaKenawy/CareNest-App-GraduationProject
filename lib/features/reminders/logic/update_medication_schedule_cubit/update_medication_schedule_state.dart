import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_medication_schedule_state.freezed.dart';

@freezed
class UpdateMedicationScheduleState<T> with _$UpdateMedicationScheduleState<T> {
  const factory UpdateMedicationScheduleState.initial() = _Initial;
  const factory UpdateMedicationScheduleState.updateMedicationLoading() = UpdateMedicationLoading;
  const factory UpdateMedicationScheduleState.updateMedicationSuccess(T data) = UpdateMedicationSuccess<T>;
  const factory UpdateMedicationScheduleState.updateMedicationError({required String error}) = UpdateMedicationError;
}
