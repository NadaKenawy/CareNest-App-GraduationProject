// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/mark_vaccine_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/mark_vaccine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class VaccinationItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String data;
  final String vaccineId;
  final bool administered;

  const VaccinationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.data,
    required this.vaccineId,
    required this.administered,
  });

  @override
  State<VaccinationItem> createState() => _VaccinationItemState();
}

class _VaccinationItemState extends State<VaccinationItem> {
  bool isAdministered = false;

  @override
  void initState() {
    super.initState();
    isAdministered = widget.administered;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.r),
          border: Border(
            left: BorderSide(
              color: ColorsManager.secondryBlueColor,
              width: 8.w,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              BlocBuilder<MarkVaccineCubit, MarkVaccineState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () async {
                      if (isAdministered) {
                        return; 
                      }
                      setState(() {
                        isAdministered = true; 
                      });

                      final babyId = await SharedPrefHelper.getSecuredString(
                          SharedPrefKeys.babyId);
                      context.read<MarkVaccineCubit>().markVaccine(
                            babyId,
                            widget.vaccineId,context
                          );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorsManager.secondryBlueColor, width: 2.w),
                        shape: BoxShape.circle,
                        color: isAdministered
                            ? ColorsManager.secondryBlueColor
                            : Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.sp),
                        child: Icon(
                          isAdministered ? Icons.check : null,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeightHelper.medium,
                        fontSize: 12.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
