import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/update_user_image_repo.dart';
import 'update_user_image_state.dart';

class UpdateUserImageCubit extends Cubit<UpdateUserImageState> {
  UpdateUserImageCubit(this._updateUserImageRepo)
      : super(const UpdateUserImageState.initial());

  final UpdateUserImageRepo _updateUserImageRepo;

  Future<void> uploadImage(File imageFile) async {
    emit(const UpdateUserImageState.loading());

    final response = await _updateUserImageRepo.uploadImage(imageFile);

    response.when(
      success: (updateUserImageResponse) {
        emit(UpdateUserImageState.success(updateUserImageResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdateUserImageState.error(apiErrorModel));
      },
    );
  }
}
