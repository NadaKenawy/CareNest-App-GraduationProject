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
        emit(AddBabyState.addBabysuccess(addBabyResponse));
      },
      failure: (error) {
        emit(AddBabyState.addBabyerror(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
