import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/font_weight_helper.dart';
import '../../../../../core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';

class VaccinationsSidebar extends StatelessWidget {
  final Function(String, String) onBabySelected; 
  final String selectedBabyName;

  const VaccinationsSidebar({
    super.key,
    required this.onBabySelected,
    required this.selectedBabyName,
  });

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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: baby.name == selectedBabyName
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
                            baby.gender == 'Male'
                                ? AppImages.boyBabyImage
                                : AppImages.girlBabyImage,
                            width: 48.r,
                          ),
                          title: Text(
                            (baby.name?.isNotEmpty ?? false)
                                ? "${baby.name![0].toUpperCase()}${baby.name!.substring(1)}"
                                : 'Unknown',
                            style: TextStyle(
                              fontSize:
                                  baby.name == selectedBabyName ? 20.sp : 16.sp,
                              fontWeight: baby.name == selectedBabyName
                                  ? FontWeightHelper.semiBold
                                  : FontWeight.normal,
                              color: baby.name == selectedBabyName
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          onTap: () async {
                            await saveBabyData(baby.id ?? '', baby.name ?? '');
                            onBabySelected(baby.name ?? '', baby.id ?? '');
                            context
                                .read<GetBabyVaccinesCubit>()
                                .getBabyVaccines(baby.id ?? '');
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
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

  Future<void> saveBabyData(String id, String name) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyName, name);
    log("Saved id: $id and name: $name");
  }
}
