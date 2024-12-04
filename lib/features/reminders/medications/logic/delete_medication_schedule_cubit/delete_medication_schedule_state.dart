import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_medication_schedule_state.freezed.dart';

@freezed
class DeleteMedicationScheduleState with _$DeleteMedicationScheduleState {
  const factory DeleteMedicationScheduleState.initial() = _Initial;
  const factory DeleteMedicationScheduleState.deleteMedicationScheduleLoading() =
      DeleteMedicationScheduleLoading;
  const factory DeleteMedicationScheduleState.deleteMedicationScheduleSuccess() =
      DeleteMedicationScheduleSuccess;
  const factory DeleteMedicationScheduleState.deleteMedicationScheduleError(
      {required String error}) = DeleteMedicationScheduleError;
}
