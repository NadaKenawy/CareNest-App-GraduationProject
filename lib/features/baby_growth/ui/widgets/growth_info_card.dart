import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_state.dart';

import 'put_growth_data_skeletonizer.dart';

class GrowthInfoCard extends StatelessWidget {
  const GrowthInfoCard({
    super.key,
    this.lastRecord,
    this.lastRecordValue,
    this.current,
    this.currentValue,
    this.status,
    this.isHeightCard = true,
  });

  final String? lastRecord, lastRecordValue, current, currentValue;
  final String? status;
  final bool isHeightCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<LatestGrowthDataCubit, LatestGrowthDataState>(
        builder: (context, state) {
          if (state is Loading) {
            return PutGrowthDataSkeletonizer();
          }
          if (state is Success) {
            final growthData = state.latestGrowthData;
            final String? status = isHeightCard
                ? growthData.heightStatus
                : growthData.weightStatus;

            final Color statusColor =
                (status == 'Average' || status == 'Normal')
                    ? Colors.green
                    : (status == 'Overweight' || status == 'Tall')
                        ? Colors.orange
                        : Colors.red;

            final String statusMessage = (status == 'Normal' ||
                    status == 'Average')
                ? "Your baby’s growth is normal."
                : (status == 'Underweight')
                    ? "Your baby is underweight. Ensure proper nutrition."
                    : (status == 'Overweight')
                        ? "Your baby is overweight. Focus on a balanced diet."
                        : (status == 'Short')
                            ? "Your baby is shorter than average. Monitor growth."
                            : (status == 'Tall')
                                ? "Your baby is taller than average. Keep tracking."
                                : "No recent data available.";

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      lastRecord ?? 'Last recorded data',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    Text(
                      lastRecordValue ?? '  -- ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      current ?? 'Current status',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    Text(
                      currentValue ?? '  -- ',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: statusColor,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  statusMessage,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: statusColor,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ],
            );
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return const Center(
              child: Text(
                'Failed to load growth data',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
