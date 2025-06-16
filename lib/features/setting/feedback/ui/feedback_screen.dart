import 'package:care_nest/features/setting/feedback/ui/widgets/feedback_screen_body.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FeedbackScreenBody(),
    );
  }
}
