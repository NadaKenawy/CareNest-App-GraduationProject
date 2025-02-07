import 'package:care_nest/features/baby_growth/data/models/get_baby_growth_response.dart';
import 'package:care_nest/features/baby_growth/logic/cubit/get_baby_growth_cubit_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/cubit/get_baby_growth_cubit_state.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/baby_growth_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBabyHeightGrowthBlocBuilder extends StatelessWidget {
  const GetBabyHeightGrowthBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBabyHeightGrowthCubit, GetBabyHeightGrowthState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return setupLoading();
            },
            success: (heightData) {
              var heights = List<MeasurementData>.from(heightData!);
              // List<MeasurementData> heights = heightData!;
              return setupSuccess(heights);
            },
            error: (error) {
              return setupError();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupSuccess(List<MeasurementData> heightList) {
    return BabyGrowthChart(
      userHeights: heightList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
