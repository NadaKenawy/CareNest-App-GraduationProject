import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../logic/predicition_cubit/prediction_cubit.dart';
import '../../logic/predicition_cubit/prediction_state.dart';
import '../widgets/recorder_screen_body.dart';

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
            // Send to create cry API with the prediction result
            if (predictionResponse.prediction != null) {
              _sendToCreateCry(context, predictionResponse.prediction!);
            }
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

  void _sendToCreateCry(BuildContext context, String prediction) {
    try {
      // Get the file path from the recorder screen
      final recorderState =
          context.findAncestorStateOfType<RecorderScreenBodyState>();
      if (recorderState != null && recorderState.filePath != null) {
        recorderState.sendToCreateCry(prediction);
      }
    } catch (e) {
      log('Error in _sendToCreateCry: $e');
    }
  }
}
