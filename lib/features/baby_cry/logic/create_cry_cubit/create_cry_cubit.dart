import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/create_cry_repo.dart';
import 'create_cry_state.dart';

class CreateCryCubit extends Cubit<CreateCryState> {
  CreateCryCubit(this._createCryRepo) : super(const CreateCryState.initial());
  final CreateCryRepo _createCryRepo;

  Future<void> createCry(String token, File audioFile, String cryType) async {
    emit(const CreateCryState.loading());

    final response = await _createCryRepo.createCry(token, audioFile, cryType);

    response.when(
      success: (createCryResponse) {
        emit(CreateCryState.success(createCryResponse));
      },
      failure: (apiErrorModel) {
        emit(CreateCryState.error(apiErrorModel));
      },
    );
  }
}
