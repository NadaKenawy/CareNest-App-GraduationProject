import 'package:care_nest/features/add_baby/logic/get_baby_data_cubit/get_baby_data_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_baby_data_cubit/get_baby_data_state.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyDataBlocBuilder extends StatelessWidget {
  const BabyDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBabyDataCubit, GetBabyDataState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return _setupLoading();
          },
          success: (babyData) {
            return BabyDataScreenBody(babyData: babyData);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
