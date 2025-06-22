import 'package:care_nest/features/setting/ui/feedback/ui/widgets/get_feedbacks_bloc_builder.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:GetFeedbacksBlocBuilder(),
    );
  }
}
