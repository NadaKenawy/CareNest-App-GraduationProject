import 'dart:developer';
import 'package:care_nest/features/entertainment/data/repos/get_all_stories_repo.dart';
import 'package:care_nest/features/entertainment/logic/get_all_stories_cubit/get_all_stories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class GetAllStoriesCubit extends Cubit<GetAllStoriesState> {
  GetAllStoriesCubit(this._getAllStoriesRepo)
      : super(const GetAllStoriesState.initial());

  final GetAllStoriesRepo _getAllStoriesRepo;

  Future<void> getAllStories() async {
    emit(const GetAllStoriesState.loading());

    String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getAllStoriesRepo.getAllStories(token);
    if (isClosed) return;

    response.when(
      success: (stories) {
        log('Stories data ${stories.data}');
        emit(GetAllStoriesState.success(stories.data ?? []));
      },
      failure: (apiErrorModel) {
        emit(GetAllStoriesState.error(apiErrorModel));
      },
    );
  }
}
