import 'package:care_nest/features/community/data/repos/get_online_users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'get_online_users_state.dart';

class GetOnlineUsersCubit extends Cubit<GetOnlineUsersState> {
  GetOnlineUsersCubit(this._getOnlineUsersRepo)
      : super(const GetOnlineUsersState.initial());

  final GetOnlineUsersRepo _getOnlineUsersRepo;

  void getOnlineUsers() async {
    emit(const GetOnlineUsersState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _getOnlineUsersRepo.getOnlineUsers(token);

    response.when(
      success: (getOnlineUsersResponse) {
        emit(
          GetOnlineUsersState.success(getOnlineUsersResponse.data),
        );
      },
      failure: (apiErrorModel) {
        emit(GetOnlineUsersState.error(apiErrorModel));
      },
    );
  }
}
