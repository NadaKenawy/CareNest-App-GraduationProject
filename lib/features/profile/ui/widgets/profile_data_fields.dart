import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/update_user_cubit/update_user_cubit.dart';

class ProfileDataFields extends StatelessWidget {
  const ProfileDataFields({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateUserCubit>();
    cubit.firstNameController.text = user.firstname;
    cubit.lastNameController.text = user.lastname;
    cubit.dateOfBirth.text = user.dateOfBirth != null
        ? DateFormat('d/M/yyyy').format(user.dateOfBirth!)
        : 'Date not available';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: cubit.firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'First Name is required';
                      }
                      if (value.length < 3) {
                        return 'First Name must be at least 3 characters';
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'First Name must contain only letters';
                      }
                      return null;
                    },
                    width: 170.w,
                    hintText: user.firstname,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: AppTextFormField(
                    controller: cubit.lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Last Name is required';
                      }
                      if (value.length < 3) {
                        return 'Last Name must be at least 3 characters';
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Last Name must contain only letters';
                      }
                      return null;
                    },
                    width: 170.w,
                    hintText: user.lastname,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            AppTextFormField(
                enabled: false,
                hintText: user.email,
                hintStyle:
                    const TextStyle(color: ColorsManager.primaryBlueColor)),
            SizedBox(
              height: 16.h,
            ),
            AppTextFormField(
              controller: cubit.dateOfBirth,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date of Birth is required';
                }
                if (!RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$').hasMatch(value)) {
                  return 'Date of Birth must be in the format dd/MM/yyyy';
                }
                return null;
              },
              hintText: user.dateOfBirth != null
                  ? DateFormat('d/M/yyyy').format(user.dateOfBirth!)
                  : 'Date not available',
            ),
            SizedBox(
              height: 32.h,
            ),
            AppTextButton(
              buttonText: "Save Changes",
              onPressed: () {
                validateThenUpdate(context, user);
              },
              textStyle: TextStyles.font16WhiteBold.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
          ],
        ),
      ),
    );
  }

  void validateThenUpdate(BuildContext context, UserModel user) async {
    final cubit = context.read<UpdateUserCubit>();
    if (cubit.formKey.currentState!.validate()) {
      context.read<UpdateUserCubit>().emitUpdateUserStates(
            oldFirstName: user.firstname,
            oldLastName: user.lastname,
            oldDateOfBirth: user.dateOfBirth != null
                ? DateFormat('d/M/yyyy').format(user.dateOfBirth!)
                : 'Date not available',
          );

      DateTime? parsedDate;
      if (cubit.dateOfBirth.text.isNotEmpty) {
        try {
          parsedDate = DateFormat('d/M/yyyy').parse(cubit.dateOfBirth.text);
        } catch (e) {
          parsedDate = user.dateOfBirth;
        }
      } else {
        parsedDate = user.dateOfBirth;
      }

      final updatedUser = user.copyWith(
        firstname: cubit.firstNameController.text.isNotEmpty
            ? cubit.firstNameController.text
            : user.firstname,
        lastname: cubit.lastNameController.text.isNotEmpty
            ? cubit.lastNameController.text
            : user.lastname,
        dateOfBirth: parsedDate,
      );

      context.read<UserCubit>().setUser(updatedUser);
      saveUserDataLocally(updatedUser);
    }
  }
}
