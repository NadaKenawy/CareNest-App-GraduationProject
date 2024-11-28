import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_medication_schedule_state.freezed.dart';

@freezed
class AddMedicationScheduleState<T> with _$AddMedicationScheduleState<T> {
  const factory AddMedicationScheduleState.initial() = _Initial;
  const factory AddMedicationScheduleState.addMedicationScheduleLoading() = AddMedicationScheduleLoading;
  const factory AddMedicationScheduleState.addMedicationScheduleSuccess(T data) = AddMedicationScheduleSuccess<T>;
  const factory AddMedicationScheduleState.addMedicationScheduleError({required String error}) = AddMedicationScheduleError;
}
