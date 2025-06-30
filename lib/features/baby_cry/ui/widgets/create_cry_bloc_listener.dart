import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/create_cry_cubit/create_cry_cubit.dart';
import '../../logic/create_cry_cubit/create_cry_state.dart';

class CreateCryBlocListener extends StatelessWidget {
  final void Function(String? cryId)? onSuccess;
  const CreateCryBlocListener({super.key, this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCryCubit, CreateCryState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            log('Create Cry Loading...');
          },
          success: (createCryResponse) {
            log('Create Cry Success: [32m${createCryResponse.toJson()}[0m');
            final cryId = createCryResponse.data?.id;
            if (onSuccess != null) {
              onSuccess!(cryId);
            }
          },
          error: (error) {
            log('Create Cry Error: ${error.message}');
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
