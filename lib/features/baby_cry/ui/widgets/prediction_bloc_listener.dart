import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Uploading audio...')),
            );
          },
          success: (predictionResponse) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Prediction: ${predictionResponse.prediction}')),
            );
            //  GoRouter.of(context).push(AppRouter.kAnalysisResultScreen);
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${error.message}')),
            );
            log('Error: ${error.message}');
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
