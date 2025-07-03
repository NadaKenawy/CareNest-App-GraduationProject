import 'dart:developer';

import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_fields.dart';
import 'package:care_nest/features/add_baby/ui/widgets/update_baby_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import '../../data/models/get_all_babies/get_all_babies_response.dart';
import '../../logic/update_baby_cubit/update_baby_cubit.dart';
import 'gender_selection.dart';
import 'header_section.dart';

class BabyDataScreenBody extends StatefulWidget {
  const BabyDataScreenBody({
    super.key,
    required this.babiesData,
  });
  final BabiesData babiesData;

  @override
  State<BabyDataScreenBody> createState() => _BabyDataScreenBodyState();
}

class _BabyDataScreenBodyState extends State<BabyDataScreenBody> {
  String gender = '';
  String selectedDate = '';

  @override
  Widget build(BuildContext context) {
    const Gradient gradient = LinearGradient(
      colors: [
        ColorsManager.secondryBlueColor,
        ColorsManager.primaryPinkColor,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final latestWeight =
        getLatestValue(widget.babiesData.weight, isWeight: true);
    final latestHeight =
        getLatestValue(widget.babiesData.height, isWeight: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderSection(
            gender: widget.babiesData.gender,
            babyName: widget.babiesData.name,
            babyId: widget.babiesData.id,
          ),
          SizedBox(height: 40.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BabyDataFields(
                      gender: widget.babiesData.gender,
                      hintText: widget.babiesData.name ?? 'Baby Name',
                      controller:
                          context.read<UpdateBabyCubit>().nameController,
                      gradient: gradient,
                      prefixIcon: Icons.child_care,
                    ),
                    SizedBox(height: 24.h),
                    BabyDataFields(
                      gender: widget.babiesData.gender,
                      hintText: widget.babiesData.dateOfBirth != null
                          ? widget.babiesData.dateOfBirth
                              .toString()
                              .split(' ')[0]
                          : 'Date of Birth',
                      gradient: gradient,
                      prefixIcon: FontAwesomeIcons.calendarDay,
                      controller: TextEditingController(text: selectedDate),
                      onTap: _selectDate,
                      readOnly: true,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: BabyDataFields(
                            gender: widget.babiesData.gender,
                            hintText: latestWeight?.toString() ?? 'Weight',
                            controller: context
                                .read<UpdateBabyCubit>()
                                .weightController,
                            gradient: gradient,
                            prefixIcon: FontAwesomeIcons.weightScale,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: BabyDataFields(
                            gender: widget.babiesData.gender,
                            hintText: latestHeight?.toString() ?? 'Height',
                            controller: context
                                .read<UpdateBabyCubit>()
                                .heightController,
                            gradient: gradient,
                            prefixIcon: FontAwesomeIcons.rulerVertical,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    GenderSelection(
                      gradient: gradient,
                      gender: gender.isNotEmpty
                          ? gender
                          : widget.babiesData.gender ?? 'Gender',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: AppTextButton(
              buttonText: 'Save',
              textStyle: TextStyles.font16WhiteMedium,
              gradientColors: widget.babiesData.gender == 'Male'
                  ? [
                      ColorsManager.secondryBlueColor,
                      ColorsManager.secondryBlueColor
                    ]
                  : widget.babiesData.gender == 'Female'
                      ? [
                          ColorsManager.primaryPinkColor,
                          ColorsManager.primaryPinkColor
                        ]
                      : [
                          ColorsManager.secondryBlueColor,
                          ColorsManager.primaryPinkColor
                        ],
              onPressed: () {
                log('Save button pressed');
                context
                    .read<UpdateBabyCubit>()
                    .emitUpdateBabyState(widget.babiesData.id ?? '');
              },
            ),
          ),
          const UpdateBabyBlocListener(),
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
      setState(
        () {
          selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
          context.read<UpdateBabyCubit>().dateOfBirthOfBabyController.text =
              selectedDate;
        },
      );
    }
  }

  num? getLatestValue(dynamic data, {bool isWeight = true}) {
    if (data == null || data.isEmpty) return null;

    for (var item in data.reversed) {
      if (isWeight) {
        if (item.weight != null) {
          return item.weight;
        }
      } else {
        if (item.height != null) {
          return item.height;
        }
      }
    }
    return null;
  }
}
