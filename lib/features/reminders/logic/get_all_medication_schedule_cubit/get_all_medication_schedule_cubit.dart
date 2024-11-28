import 'package:care_nest/features/reminders/data/repos/get_all_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetAllMedicationScheduleCubit
    extends Cubit<GetAllMedicationScheduleState> {
  GetAllMedicationScheduleCubit(this._getAllMedicationScheduleRepo)
      : super(const GetAllMedicationScheduleState.initial());
  final GetAllMedicationScheduleRepo _getAllMedicationScheduleRepo;

  void getAllMedicationSchedule(String id) async {
    emit(const GetAllMedicationScheduleState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response =
        await _getAllMedicationScheduleRepo.getAllMedicationSchedule(token, id);

    response.when(
      success: (getAllMedicationScheduleResponse) {
        emit(
          GetAllMedicationScheduleState.success(
              getAllMedicationScheduleResponse.data),
        );
      },
      failure: (error) {
        emit(GetAllMedicationScheduleState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
