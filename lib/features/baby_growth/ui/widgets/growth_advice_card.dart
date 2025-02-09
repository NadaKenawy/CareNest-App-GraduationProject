import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_state.dart';

class GrowthAdviceCard extends StatelessWidget {
  final String measurementType;

  const GrowthAdviceCard({super.key, required this.measurementType});

  @override
  Widget build(BuildContext context) {
    final bool isWeight = measurementType == "weight";

    return BlocBuilder<LatestGrowthDataCubit, LatestGrowthDataState>(
      builder: (context, state) {
        if (state is Success) {
          final growthData = state.latestGrowthData;

          final String status = isWeight
              ? (growthData.weightStatus ?? "Unknown")
              : (growthData.heightStatus ?? "Unknown");

          final Color statusColor;
          if (status == 'Normal') {
            statusColor = Colors.green;
          } else if (status == 'Overweight' || status == 'Tall') {
            statusColor = Colors.orange;
          } else {
            statusColor = Colors.red;
          }
          String adviceMessage;
          if (status == 'Normal' || status == 'Average') {
            adviceMessage = isWeight
                ? "Great job, mama! Keep providing a balanced diet to support steady growth. ✅"
                : "Your baby’s height is on track! Keep up the good care. ✅";
          } else if (status == 'Underweight') {
            adviceMessage =
                "A little extra nutrition will help! Add more proteins and healthy fats. 🍼✨";
          } else if (status == 'Overweight') {
            adviceMessage =
                "Active playtime and a balanced diet will keep your baby healthy. 🍼✨";
          } else if (status == 'Short') {
            adviceMessage =
                "Every child grows at their own pace. Keep monitoring with love. ❤️";
          } else if (status == 'Tall') {
            adviceMessage =
                "Growing strong! Keep up with nutritious meals and happy moments. ❤️";
          } else {
            adviceMessage =
                "No data yet, but you’re doing great! Keep tracking. 👶";
          }

          return Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: statusColor, width: 2.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  adviceMessage,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.semiBold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
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
    );
  }
}
