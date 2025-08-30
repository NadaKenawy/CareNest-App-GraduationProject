import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/core/widgets/custom_button.dart';

import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/get_all_babies_medicines_bloc_builder.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/medicines_list_view_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/get_all_medicines_bloc_builder.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/week_days_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/babies_dropdown.dart';

class MedicationsScreenBody extends StatefulWidget {
  const MedicationsScreenBody({super.key});

  @override
  _MedicationsScreenBodyState createState() => _MedicationsScreenBodyState();
}

class _MedicationsScreenBodyState extends State<MedicationsScreenBody> {
  final DateTime _currentDate = DateTime.now();
  String? babyId;
  int _selectedIndex = 0;
  String? selectedBabyName = '';
  String selectedBabyImage = AppImages.girlProfileImage;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBabyData();
  }

  Future<void> loadBabyData() async {
    final babyIdFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);
    final babyNameFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    final gender = await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyGender);
    final savedImage = await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyImage);
    
    setState(() {
      babyId = babyIdFromStorage;
      selectedBabyName = babyNameFromStorage;
      if (savedImage.isNotEmpty) {
        selectedBabyImage = savedImage;
      } else if (gender.isNotEmpty) {
        selectedBabyImage = gender == 'Male' 
            ? AppImages.boyProfileImage 
            : AppImages.girlProfileImage;
      }
      isLoading = false;
    });

    if (babyId != null && babyId!.isNotEmpty) {
      context.read<GetAllBabiesCubit>().state.maybeWhen(
        success: (babiesData) {
          try {
            final matchingBabies = babiesData!.where((b) => b.id == babyId);
            if (matchingBabies.isNotEmpty) {
              final baby = matchingBabies.first;
              final newImage = baby.babyImage?.isNotEmpty == true 
                  ? baby.babyImage! 
                  : (baby.gender == 'Male' 
                      ? AppImages.boyProfileImage 
                      : AppImages.girlProfileImage);
              setState(() {
                selectedBabyImage = newImage;
              });
              SharedPrefHelper.setSecuredString(SharedPrefKeys.babyImage, newImage);
              SharedPrefHelper.setSecuredString(SharedPrefKeys.babyGender, baby.gender ?? 'Male');
            }
          } catch (e) {
            // If baby not found, keep default image
          }
        },
        orElse: () {},
      );
      context
          .read<GetAllMedicationScheduleCubit>()
          .getAllMedicationSchedule(babyId!);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAddBabyDialog(context);
      });
    }
  }

  void onDropdownItemSelected(
      String? id, String name, String image, int index) async {
    if (index == 0) {
      setState(() {
        babyId = id;
        selectedBabyName = name;
        selectedBabyImage = image;
      });
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id!);
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyName, name);
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyImage, image);
      context
          .read<GetAllMedicationScheduleCubit>()
          .getAllMedicationSchedule(id);
    } else if (index == 1) {
      setState(() {
        babyId = null;
        selectedBabyName = "All Reminders";
        selectedBabyImage = AppImages.boyAndGirlImage;
      });
      context
          .read<GetAllBabiesMedicationScheduleCubit>()
          .getAllBabiesMedicationSchedule();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAddBabyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.child_care,
                  size: 48, color: ColorsManager.primaryPinkColor),
              const SizedBox(height: 16),
              Text(
                "Let's get started!",
                style: TextStyles.font16BlackMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Add your baby to begin tracking their health and medications. You can add more anytime.',
                textAlign: TextAlign.center,
                style: TextStyles.font16BlackMedium
                    .copyWith(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 24),
              AppTextButton(
                buttonText: 'Add Baby',
                textStyle: TextStyles.font16WhiteMedium,
                buttonColor: ColorsManager.primaryPinkColor,
                borderRadius: 16,
                buttonHeight: 48,
                buttonWidth: double.infinity,
                onPressed: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kAddBabyScreen);
                },
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: 16),
              Text(
                'Already have a baby?',
                style: TextStyles.font16BlackMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Select from the dropdown to view their medications history.',
                textAlign: TextAlign.center,
                style: TextStyles.font16BlackMedium
                    .copyWith(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 24),
              AppTextButton(
                buttonText: 'OK',
                textStyle: TextStyles.font16WhiteMedium,
                buttonColor: ColorsManager.primaryPinkColor,
                borderRadius: 16,
                buttonHeight: 48,
                buttonWidth: double.infinity,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate =
        _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
    DateTime endDate = startDate.add(const Duration(days: 6));
    List<DateTime> weekDays = _generateDates(startDate, endDate);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.white,
        title: Text(
          _selectedIndex == 1
              ? 'All Medications'
              : selectedBabyName != null && selectedBabyName!.isNotEmpty
                  ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Medications"
                  : 'My Medications',
          style: TextStyles.font20BlackSemiMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: BabyDropdown(
              selectedImage: selectedBabyImage,
              mode: BabyDropdownMode.withAllReminders,
              onSelected: (id, name, image, [index]) {
                onDropdownItemSelected(id, name, image, index ?? 0);
              },
            ),
          )
        ],
      ),
      floatingActionButton:
          (babyId != null && babyId!.isNotEmpty && _selectedIndex != 1)
              ? FloatingActionButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.kAddMedicineScreen)
                        .then((value) async {
                      if (value == true) {
                        final babyId = await SharedPrefHelper.getSecuredString(
                            SharedPrefKeys.babyId);
                        context
                            .read<GetAllMedicationScheduleCubit>()
                            .getAllMedicationSchedule(babyId);
                      }
                    });
                  },
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: ColorsManager.primaryPinkColor,
                      width: 3,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 32.sp,
                    color: ColorsManager.primaryPinkColor,
                  ),
                )
              : null,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            WeekDaysWidget(weekDays: weekDays, currentDate: _currentDate),
            SizedBox(height: 32.h),
            Text(
              'Today',
              style: TextStyle(
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 28.sp,
                color: Colors.black,
              ),
            ),
            isLoading
                ? const Expanded(
                    child: MedicinesListViewSkeletonizer(),
                  )
                : (selectedBabyName == null || selectedBabyName!.isEmpty)
                    ? const SizedBox.shrink()
                    : _selectedIndex == 1
                        ? const GetAllBabiesMedicinesBlocBuilder()
                        : const GetAllMedicinesBlocBuilder(),
            SizedBox(height: _selectedIndex == 1 ? 24.h : 100.h),
          ],
        ),
      ),
    );
  }

  List<DateTime> _generateDates(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }
}
