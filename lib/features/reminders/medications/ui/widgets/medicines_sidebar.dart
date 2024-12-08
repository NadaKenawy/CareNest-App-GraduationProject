// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicinesDrawer extends StatefulWidget {
  const MedicinesDrawer({
    super.key,
    required this.onItemSelected,
    required this.selectedBabyName,
  });

  final Function(int) onItemSelected;
  final Function(String) selectedBabyName;

  @override
  State<MedicinesDrawer> createState() => _MedicinesDrawerState();
}

class _MedicinesDrawerState extends State<MedicinesDrawer> {
  String? _currentSelectedName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Get the saved baby name from shared preferences
      final savedName =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
      setState(() {
        _currentSelectedName = savedName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<GetAllBabiesCubit>().getAllBabies();

    return Drawer(
      width: 250.w,
      child: BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Success) {
            final babiesList = state.babiesData;
            if (babiesList == null || babiesList.isEmpty) {
              return const Center(child: Text('No babies available.'));
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: ListView(
                children: [
                  for (var baby in babiesList)
                    _buildListTile(
                      context,
                      babyName: baby.name ?? 'Unknown',
                      babyId: baby.id,
                      image: baby.gender == 'Male'
                          ? AppImages.boyBabyImage
                          : AppImages.girlBabyImage,
                      isSelected: baby.name == _currentSelectedName,
                      onTap: () async {
                        context
                            .read<GetAllMedicationScheduleCubit>()
                            .getAllMedicationSchedule(baby.id!);
                        await saveBabyData(baby.id ?? '', baby.name ?? '');
                        setState(() {
                          _currentSelectedName = baby.name ?? '';
                        });
                        widget.selectedBabyName(baby.name ?? '');
                        widget.onItemSelected(0);
                        Navigator.pop(context);
                      },
                    ),
                  _buildListTile(
                    context,
                    babyName: 'All Reminders',
                    babyId: null,
                    image: 'assets/images/Boy&Girl.png',
                    isSelected: _currentSelectedName == 'All Reminders',
                    onTap: () {
                      context
                          .read<GetAllBabiesMedicationScheduleCubit>()
                          .getAllBabiesMedicationSchedule();
                      setState(() {
                        _currentSelectedName = 'All Reminders';
                      });
                      widget.selectedBabyName('All Reminders');
                      widget.onItemSelected(1);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          } else if (state is Error) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String babyName,
    String? babyId,
    required String image,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    ColorsManager.fourthryBlueColor,
                    ColorsManager.fourthryPinkColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Image.asset(
            image,
            width: 48.r,
          ),
          title: Text(
            babyName,
            style: TextStyle(
              fontSize: isSelected ? 20.sp : 16.sp,
              fontWeight:
                  isSelected ? FontWeightHelper.semiBold : FontWeight.normal,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Future<void> saveBabyData(String id, String name) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyName, name);
    log("Saved id: $id and name: $name");
  }
}
