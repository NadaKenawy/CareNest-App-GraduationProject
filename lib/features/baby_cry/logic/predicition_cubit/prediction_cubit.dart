import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/prediction_repo.dart';
import 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  PredictionCubit(this._predictionRepo)
      : super(const PredictionState.initial());
  final PredictionRepo _predictionRepo;
  Future<void> uploadAudio(File audioFile) async {
    emit(const PredictionState.loading());

    final response = await _predictionRepo.uploadAudio(audioFile);

    response.when(
      success: (predictionResponse) {
        emit(PredictionState.success(predictionResponse));
      },
      failure: (apiErrorModel) {
        emit(PredictionState.error(apiErrorModel));
      },
    );
  }
}
