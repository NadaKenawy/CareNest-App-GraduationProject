import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/add_baby/ui/widgets/add_baby_bloc_listener.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';

import '../../logic/add_baby_cubit/add_baby_cubit.dart';
import 'add_baby_header_section.dart';
import 'gender_selection.dart';

class AddBabyScreenBody extends StatefulWidget {
  const AddBabyScreenBody({super.key});

  @override
  _AddBabyScreenBodyState createState() => _AddBabyScreenBodyState();
}

class _AddBabyScreenBodyState extends State<AddBabyScreenBody> {
  final TextEditingController _dobController = TextEditingController();
  String gender = '';

  Gradient getGradient() {
    if (gender == 'Male') {
      return const LinearGradient(
        colors: [
          ColorsManager.secondryBlueColor,
          ColorsManager.secondryBlueColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (gender == 'Female') {
      return const LinearGradient(
        colors: [
          ColorsManager.primaryPinkColor,
          ColorsManager.primaryPinkColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else {
      return const LinearGradient(
        colors: [
          ColorsManager.secondryBlueColor,
          ColorsManager.primaryPinkColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AddBabyHeaderSection(
            gender: gender,
          ),
          SizedBox(height: 40.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: context.read<AddBabyCubit>().formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BabyDataFields(
                        hintText: 'Baby Name',
                        gradient: getGradient(),
                        prefixIcon: Icons.child_care,
                        controller: context.read<AddBabyCubit>().nameController,
                      ),
                      SizedBox(height: 24.h),
                      BabyDataFields(
                        hintText: 'Date of Birth',
                        gradient: getGradient(),
                        prefixIcon: FontAwesomeIcons.calendarDay,
                        controller: _dobController,
                        onTap: _selectDate,
                        readOnly: true,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Expanded(
                            child: BabyDataFields(
                              hintText: 'Weight',
                              gradient: getGradient(),
                              prefixIcon: FontAwesomeIcons.weightScale,
                              controller:
                                  context.read<AddBabyCubit>().weightController,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: BabyDataFields(
                              hintText: 'Height',
                              gradient: getGradient(),
                              prefixIcon: FontAwesomeIcons.rulerVertical,
                              controller:
                                  context.read<AddBabyCubit>().heightController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      GenderSelection(
                        gradient: getGradient(),
                        gender: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                            context.read<AddBabyCubit>().genderController.text =
                                value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: AppTextButton(
              buttonText: 'Save',
              textStyle: TextStyles.font16WhiteMedium,
              gradientColors: gender == 'Male'
                  ? [
                      ColorsManager.secondryBlueColor,
                      ColorsManager.secondryBlueColor,
                    ]
                  : gender == 'Female'
                      ? [
                          ColorsManager.primaryPinkColor,
                          ColorsManager.primaryPinkColor,
                        ]
                      : [
                          ColorsManager.secondryBlueColor,
                          ColorsManager.primaryPinkColor,
                        ],
              onPressed: () {
                validateThenSave(context);
              },
            ),
          ),
          const AddBabyBlocListener(),
        ],
      ),
    );
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
        _dobController.text = formattedDate;
        context.read<AddBabyCubit>().dateOfBirthOfBabyController.text =
            formattedDate;
      });
    }
  }

  void validateThenSave(BuildContext context) async {
    final addBabyCubit = context.read<AddBabyCubit>();
    if (addBabyCubit.formKey.currentState!.validate()) {
      context.read<AddBabyCubit>().emitAddBabyStates();
    }
  }
}
