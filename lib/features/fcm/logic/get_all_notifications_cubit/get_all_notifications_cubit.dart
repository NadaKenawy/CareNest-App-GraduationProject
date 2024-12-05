import 'package:care_nest/features/fcm/data/repos/get_all_notifications_repo.dart';
import 'package:care_nest/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetAllNotificationsCubit extends Cubit<GetAllNotificationsState> {
  final GetAllNotificationsRepo _notificationsRepo;

  GetAllNotificationsCubit(this._notificationsRepo)
      : super(const GetAllNotificationsState.initial());

  void fetchNotifications() async {
    emit(const GetAllNotificationsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _notificationsRepo.getAllNotifications(token);

    response.when(
      success: (notificationsResponse) {
        emit(GetAllNotificationsState.success(
            notificationsResponse.notificationsData));
      },
      failure: (error) {
        emit(GetAllNotificationsState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
