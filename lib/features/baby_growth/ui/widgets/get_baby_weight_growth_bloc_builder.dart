import 'package:care_nest/features/baby_growth/data/models/get_baby_weight_growth/get_baby_weight_growth_response.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/baby_weight_growth_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/get_baby_weight_growth_cubit/get_baby_weight_growth_cubit.dart';
import '../../logic/get_baby_weight_growth_cubit/get_baby_weight_growth_state.dart';

class GetBabyWeightGrowthBlocBuilder extends StatelessWidget {
  const GetBabyWeightGrowthBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBabyWeightGrowthCubit, GetBabyWeightGrowthState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return setupLoading();
            },
            success: (weightData) {
              var weights = List<MeasurementData>.from(weightData!);
              // List<MeasurementData> heights = heightData!;
              return setupSuccess(weights);
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

  Widget setupSuccess(List<MeasurementData> weightList) {
    return BabyWeightGrowthChart(userWeights: weightList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
