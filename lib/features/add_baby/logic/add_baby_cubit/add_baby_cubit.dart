import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby_request_body.dart';
import 'package:care_nest/features/add_baby/data/repos/add_baby_repo.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBabyCubit extends Cubit<AddBabyState> {
  AddBabyCubit(this._addBabyRepo) : super(const AddBabyState.initial());
  final AddBabyRepo _addBabyRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController dateOfBirthOfBabyController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void emitAddBabyStates() async {
    // if (nameController.text.isEmpty ||
    //     weightController.text.isEmpty ||
    //     heightController.text.isEmpty ||
    //     dateOfBirthOfBabyController.text.isEmpty ||
    //     genderController.text.isEmpty) {
    //   emit(const AddBabyState.addBabyerror(
    //     error: "All fields are required",
    //   ));
    //   return;
    // }

    // final dateOfBirth = DateTime.tryParse(dateOfBirthOfBabyController.text);
    // if (dateOfBirth == null || dateOfBirth.isAfter(DateTime.now())) {
    //   emit(const AddBabyState.addBabyerror(
    //     error: "Date of birth must be in the past",
    //   ));
    //   return;
    // }

    emit(const AddBabyState.addBabyloading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _addBabyRepo.addBaby(
      AddBabyRequestBody(
        name: nameController.text,
        weight: num.tryParse(weightController.text) ?? 0,
        height: num.tryParse(heightController.text) ?? 0,
        dateOfBirthOfBaby: dateOfBirthOfBabyController.text,
        gender: genderController.text,
      ),
      token,
    );

    response.when(
      success: (addBabyResponse) async {
        if (!isClosed) {
          emit(AddBabyState.addBabysuccess(addBabyResponse));
        }
      },
      failure: (error) {
        final errorMessage = error.signUpErrorModel.errors?.first.msg ??
            'Unknown error occurred.';
        emit(AddBabyState.addBabyerror(error: errorMessage));
      },
    );
  }
}
