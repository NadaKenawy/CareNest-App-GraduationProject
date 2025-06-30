import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/user_satisfaction_repo.dart';
import 'user_satisfaction_state.dart';
import '../../data/model/user_satisfaction/user_satisfaction_request_body.dart';

class UserSatisfactionCubit extends Cubit<UserSatisfactionState> {
  UserSatisfactionCubit(this._repo) : super(const UserSatisfactionState.initial());
  final UserSatisfactionRepo _repo;

  Future<void> setUserSatisfaction({
    required String cryId,
    required String userSatisfaction,
    required String token,
  }) async {
    emit(const UserSatisfactionState.loading());
    try {
      final response = await _repo.setUserSatisfaction(
        cryId: cryId,
        requestBody: UserSatisfactionRequestBody(userSatisfaction: userSatisfaction),
        token: token,
      );
      emit(UserSatisfactionState.success(response));
    } catch (e) {
      emit(UserSatisfactionState.error(e.toString()));
    }
  }
}
