import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/update_user_request_body.dart';
import '../../data/repos/update_user_repo.dart';
import 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this._updateUserRepo)
      : super(const UpdateUserState.initial());
  final UpdateUserRepo _updateUserRepo;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitUpdateUserStates({
    required String oldFirstName,
    required String oldLastName,
    required String oldDateOfBirth,
  }) async {
    emit(const UpdateUserState.loading());
    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    String formattedDate = oldDateOfBirth;
    if (dateOfBirth.text.isNotEmpty) {
      try {
        final parsedDate = DateFormat('d/M/yyyy').parse(dateOfBirth.text);
        formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
      } catch (e) {
        formattedDate = oldDateOfBirth;
      }
    }

    final response = await _updateUserRepo.updateUser(
      UpdateUserRequestBody(
        firstName: firstNameController.text.isNotEmpty
            ? firstNameController.text
            : oldFirstName,
        lastName: lastNameController.text.isNotEmpty
            ? lastNameController.text
            : oldLastName,
        dateOfBirthOfMam:
           formattedDate
      ),
      token,
    );
    response.when(
      success: (updateUserResponse) async {
        emit(UpdateUserState.success(updateUserResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdateUserState.error(apiErrorModel));
      },
    );
  }
}
