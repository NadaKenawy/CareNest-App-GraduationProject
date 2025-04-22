import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';

import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/get_all_babies_medicines_bloc_builder.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/medicines_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/get_all_medicines_bloc_builder.dart';

import 'package:care_nest/features/reminders/medications/ui/widgets/week_days_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
  String selectedBabyImage = AppImages.boyAndGirlImage;
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
    setState(() {
      babyId = babyIdFromStorage;
      selectedBabyName = babyNameFromStorage;
      isLoading = false;
    });

    if (babyId != null && babyId!.isNotEmpty) {
      context
          .read<GetAllMedicationScheduleCubit>()
          .getAllMedicationSchedule(babyId!);
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
      context
          .read<GetAllMedicationScheduleCubit>()
          .getAllMedicationSchedule(id);
    } else if (index == 1) {
      // تم اختيار All Reminders
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
            child: MedicationsDropdown(
              selectedImage: selectedBabyImage,
              onItemSelected: onDropdownItemSelected,
            ),
          )
        ],
      ),
      floatingActionButton: _selectedIndex == 1
          ? null
          : FloatingActionButton(
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
            ),
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
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : (selectedBabyName == null || selectedBabyName!.isEmpty)
                    ? Expanded(
                        child: Center(
                          child: Text(
                            'Select a baby from the dropdown to view their medication.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeightHelper.semiBold,
                              fontSize: 28.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
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
