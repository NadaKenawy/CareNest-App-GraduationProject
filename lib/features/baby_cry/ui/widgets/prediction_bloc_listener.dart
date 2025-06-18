import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../logic/cubit/prediction_cubit.dart';
import '../../logic/cubit/prediction_state.dart';

class PredictionBlocListener extends StatelessWidget {
  const PredictionBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PredictionCubit, PredictionState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            log('Loading...');
          },
          success: (predictionResponse) {
            GoRouter.of(context).push(AppRouter.kAnalysisResultScreen,
                extra: predictionResponse);
          },
          error: (error) {
            log('Error: ${error.message}');
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
