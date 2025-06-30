import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/predicition_cubit/prediction_cubit.dart';
import '../../logic/predicition_cubit/prediction_state.dart';
import '../../data/model/prediction/prediction_response_model.dart';

class PredictionBlocListener extends StatelessWidget {
  final void Function(PredictionResponse predictionResponse)? onPredictionSuccess;
  const PredictionBlocListener({super.key, this.onPredictionSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PredictionCubit, PredictionState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            log('Loading...');
          },
          success: (predictionResponse) {
            if (onPredictionSuccess != null) {
              onPredictionSuccess!(predictionResponse);
            }
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
