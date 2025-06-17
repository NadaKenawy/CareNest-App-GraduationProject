import 'package:care_nest/features/setting/ui/feedback/ui/widgets/feedback_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../logic/create_report_cubit/create_report_cubit.dart';
import '../../../logic/update_report_cubit/update_report_cubit.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => getIt<CreateReportCubit>()),
        BlocProvider(create: (context) => getIt<UpdateReportCubit>()),
      ], child: const FeedbackScreenBody()),
    );
  }
}
