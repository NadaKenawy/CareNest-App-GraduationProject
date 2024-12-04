// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_medication_schedule/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/logic/delete_medication_schedule_cubit/delete_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/delete_medication_schedule_cubit/delete_medication_schedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/text_styless.dart';
import '../../../../../core/utils/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicinesListViewItem extends StatefulWidget {
  const MedicinesListViewItem({
    super.key,
    required this.medicinesList,
    required this.scheduleId,
  });

  final dynamic medicinesList;
  final String scheduleId;

  @override
  _MedicinesListViewItemState createState() => _MedicinesListViewItemState();
}

class _MedicinesListViewItemState extends State<MedicinesListViewItem> {
  bool isColorChanged = false;
  Color buttonColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _checkLastColorChange();
  }

  Future<void> _checkLastColorChange() async {
    final prefs = await SharedPreferences.getInstance();
    final scheduleId = widget.scheduleId;
    final isColorChangedStored =
        prefs.getBool('isColorChanged_$scheduleId') ?? false;

    setState(() {
      isColorChanged = isColorChangedStored;
      buttonColor =
          isColorChanged ? ColorsManager.secondryBlueColor : Colors.grey;
    });
  }

  Future<void> _updateColor() async {
    final prefs = await SharedPreferences.getInstance();
    final scheduleId = widget.scheduleId;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    setState(() {
      isColorChanged = !isColorChanged;
      buttonColor =
          isColorChanged ? ColorsManager.secondryBlueColor : Colors.grey;
    });

    prefs.setBool('isColorChanged_$scheduleId', isColorChanged);
    prefs.setInt('lastColorChangeTime_$scheduleId', currentTime);
  }

  @override
  Widget build(BuildContext context) {
    final medicationName =
        widget.medicinesList.medicationName ?? 'Medicine Name';
    final time = widget.medicinesList.time ?? 'Time';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        height: 96.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorsManager.secondryBlueColor.withOpacity(.1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.medicineIcon,
                height: 56.h,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicationName,
                    style: TextStyles.font16PrimaryBlackMedium,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        color: Colors.black.withOpacity(.5),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        time,
                        style: TextStyle(color: Colors.black.withOpacity(.5)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 52.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.medicinesList is MedicationData)
                    BlocBuilder<DeleteMedicationScheduleCubit,
                            DeleteMedicationScheduleState>(
                        builder: (context, state) {
                      return IconButton(
                        color: ColorsManager.secondryBlueColor,
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: 'Delete Medicine',
                            desc:
                                'Are you sure you want to delete this medicine?',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              final babyId =
                                  await SharedPrefHelper.getSecuredString(
                                      SharedPrefKeys.babyId);
                              context
                                  .read<DeleteMedicationScheduleCubit>()
                                  .deleteMedicationSchedule(
                                      babyId, widget.scheduleId, context);
                            },
                          ).show();
                        },
                        icon: const Icon(Icons.remove_circle_outline_outlined),
                      );
                    }),
                  InkWell(
                    onTap: _updateColor,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: buttonColor,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
