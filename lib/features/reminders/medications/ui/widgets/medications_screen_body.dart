// ignore_for_file: use_build_context_synchronously

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_babies_medication_schedule/get_all_babies_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_medication_schedule/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/get_all_babies_medicines_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/get_all_medicines_bloc_builder.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/sidebar.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/week_days_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

class MedicationsScreenBody extends StatefulWidget {
  const MedicationsScreenBody({super.key});

  @override
  _MedicationsScreenBodyState createState() => _MedicationsScreenBodyState();
}

class _MedicationsScreenBodyState extends State<MedicationsScreenBody> {
  final DateTime _currentDate = DateTime.now();
  final SidebarXController _controller = SidebarXController(selectedIndex: -1);
  String? babyId;
  int _selectedIndex = 0;
  String? selectedBabyName = '';
  List<MedicationData> medicinesList = [];
  List<BabiesMedicationData> babiesMedicinesList = [];

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
    });

    if (babyId != null && babyId!.isNotEmpty) {
      context
          .read<GetAllMedicationScheduleCubit>()
          .getAllMedicationSchedule(babyId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate =
        _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
    DateTime endDate = startDate.add(const Duration(days: 6));
    List<DateTime> weekDays = _generateDates(startDate, endDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          _selectedIndex == 1
              ? 'All Medications'
              : selectedBabyName != null && selectedBabyName!.isNotEmpty
                  ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Medications"
                  : 'My Medications',
          style: TextStyles.font20BlackSemiBold,
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, size: 24.sp, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: ExampleSidebarX(
        controller: _controller,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedBabyName: (String name) {
          setState(() {
            selectedBabyName = name;
          });
        },
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
            _selectedIndex == 1
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
