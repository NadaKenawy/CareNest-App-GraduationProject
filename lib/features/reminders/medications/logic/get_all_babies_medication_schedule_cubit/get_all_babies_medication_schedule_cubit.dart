import 'package:care_nest/features/reminders/medications/data/repos/get_all_babies_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';

class GetAllBabiesMedicationScheduleCubit
    extends Cubit<GetAllBabiesMedicationScheduleState> {
  GetAllBabiesMedicationScheduleCubit(this._getAllBabiesMedicationScheduleRepo)
      : super(const GetAllBabiesMedicationScheduleState.initial());
  final GetAllBabiesMedicationScheduleRepo _getAllBabiesMedicationScheduleRepo;
  void getAllBabiesMedicationSchedule() async {
    emit(const GetAllBabiesMedicationScheduleState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getAllBabiesMedicationScheduleRepo
        .getAllBabiesMedicationSchedule(token);
    if (isClosed) return;

    response.when(
      success: (getAllBabiesMedicationScheduleResponse) {
        emit(
          GetAllBabiesMedicationScheduleState.success(
              getAllBabiesMedicationScheduleResponse.data),
        );
      },
      failure: (apiErrorModel) {
        emit(GetAllBabiesMedicationScheduleState.error(apiErrorModel));
      },
    );
  }
}
