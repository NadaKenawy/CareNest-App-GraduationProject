import 'dart:io';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../data/repos/update_baby_image_repo.dart';
import 'update_baby_image_state.dart';
import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class UpdateBabyImageCubit extends Cubit<UpdateBabyImageState> {
  UpdateBabyImageCubit(this._updateBabyImageRepo, this.userCubit)
      : super(const UpdateBabyImageState.initial());
  final UpdateBabyImageRepo _updateBabyImageRepo;
  final UserCubit userCubit;

  Future<void> uploadImage(File imageFile, String id) async {
    emit(const UpdateBabyImageState.loading());

    final response = await _updateBabyImageRepo.uploadImage(imageFile, id);

    response.when(
      success: (updateBabyImageResponse) async {
        if (updateBabyImageResponse.babyData?.babyImage != null &&
            updateBabyImageResponse.babyData!.babyImage!.isNotEmpty) {
          final currentUser = userCubit.state.user;
          if (currentUser != null) {
            final updatedUser = currentUser.copyWith(
                babyImage: updateBabyImageResponse.babyData!.babyImage);
            userCubit.setUser(updatedUser);
            await saveUserDataLocally(updatedUser);

            
            SharedPrefHelper.setSecuredString(SharedPrefKeys.babyImage,
                updateBabyImageResponse.babyData!.babyImage!);
            log('Updated baby image saved to UserCubit and SharedPreferences: ${updateBabyImageResponse.babyData!.babyImage}');
          }
        }

        emit(UpdateBabyImageState.success(updateBabyImageResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdateBabyImageState.error(apiErrorModel));
      },
    );
  }
}
